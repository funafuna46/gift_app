class ApplicationController < ActionController::Base
  before_action :set_liff_id

  private

  def set_liff_id
    gon.liff_id = ENV.fetch('LIFF_ID')
  end
end
