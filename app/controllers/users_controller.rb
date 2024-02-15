class UsersController < ApplicationController
  require 'net/http'

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def create
    # LIFFから取得したIDトークン
    id_token = params[:idToken]
    # LINEプラットフォームで設定されたチャネルID
    channel_id = ENV.fetch('LINE_CHANNEL_ID')

    Rails.logger.info { "ID Token: #{id_token}" }
    Rails.logger.info { "Channel ID: #{channel_id}" }

    # IDトークンをLINEプラットフォームに送信してユーザー情報を取得
    res = Net::HTTP.post_form(URI.parse('https://api.line.me/oauth2/v2.1/verify'), { 'id_token' => id_token, 'client_id' => channel_id })
    Rails.logger.info { "Response Status: #{res.code}" } # ステータスコード
    Rails.logger.info { "Response Body: #{res.body}" } # レスポンス本文

    begin
      profile = JSON.parse(res.body)
      Rails.logger.info { "Parsed JSON: #{profile}" }
    rescue JSON::ParserError => e
      Rails.logger.error { "JSON Parsing Error: #{e.message}" }
    end
    line_user_id = profile['sub']

    Rails.logger.info { "LINE User ID: #{line_user_id}" }

    user = User.find_or_create_by(line_user_id: line_user_id) do |u|
      u.name = profile['name'] # LINEのユーザー名
      u.avatar = profile['picture'] # LINEのプロフィール画像URL
    end

    Rails.logger.info { "User created or found: #{user.inspect}" }

    # セッションにユーザーIDを保存
    session[:user_id] = user.id
    Rails.logger.info { "Session user_id: #{session[:user_id]}" }

    # 必要に応じてリダイレクトやJSONレスポンスを返す
    render json: user
  end
end
