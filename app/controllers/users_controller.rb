class UsersController < ApplicationController
  require 'net/http'
  require 'uri'
  before_action :set_user, only: %i[edit update]

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def edit; end

  def create
    # フロントエンドから送られてきた（LIFFから取得した）IDトークンを受け取る
    id_token = params[:idToken]
    # LINEプラットフォームで設定されたチャネルID
    channel_id = ENV.fetch('LINE_CHANNEL_ID')

    # IDトークンをLINEプラットフォームのトークン検証APIに送信してユーザー情報を取得
    res = Net::HTTP.post_form(URI.parse('https://api.line.me/oauth2/v2.1/verify'), { 'id_token' => id_token, 'client_id' => channel_id })
    # APIからのレスポンス(res.body)をJSON形式で解析し、subキー（LINEユーザーID）に対応する値を取得
    profile = JSON.parse(res.body)
    line_user_id = profile['sub']

    # LINEユーザーIDに基づいてDB内のユーザーを検索、または新規作成
    user = User.find_or_create_by(line_user_id: line_user_id) do |u|
      u.name = profile['name'] # LINEのユーザー名
      u.avatar = profile['picture'] # LINEのプロフィール画像URL
    end

    # セッションにユーザーIDを保存し、ユーザー情報をJSON形式でフロントエンドに返す
    session[:user_id] = user.id
    render json: { user: user, reload: true }
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'プロフィールが更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :uploaded_avatar, :uploaded_avatar_cache)
  end
end
