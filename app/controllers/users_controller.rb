class UsersController < ApplicationController
  require 'net/http'
  require 'uri'

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def create
    # フロントエンドから送られてきた（LIFFから取得した）IDトークンを受け取る
    id_token = params[:idToken]
    # LINEプラットフォームで設定されたチャネルID
    channel_id = ENV.fetch('LINE_CHANNEL_ID')

    # IDトークンをLINEプラットフォームのトークン検証APIに送信してユーザー情報を取得
    res = Net::HTTP.post_form(URI.parse('https://api.line.me/oauth2/v2.1/verify'), { 'id_token' => id_token, 'client_id' => channel_id })
    # APIからのレスポンス(res.body)をJSON形式で解析し、subキー（LINEユーザーID）に対応する値を取得
    line_user_id = JSON.parse(res.body)['sub']
    # LINEユーザーIDに基づいてDB内のユーザーを検索
    user = User.find_by(line_user_id: line_user_id)
    if user.nil? # ユーザーが存在しなければ、新規ユーザーを作成
      User.create(line_user_id: line_user_id)
      # ユーザーが存在する場合、セッションにユーザーIDを保存し、ユーザー情報をJSON形式でフロントエンドに返す
    elsif (session[:user_id] = user.id)
      render json: user
    end
  end
end
