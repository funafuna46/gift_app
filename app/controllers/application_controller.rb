class ApplicationController < ActionController::Base
  before_action :set_liff_id
  helper_method :current_user

  private

  def set_liff_id
    gon.liff_id = ENV.fetch('LIFF_ID')
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
