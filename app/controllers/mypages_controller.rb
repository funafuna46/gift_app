class MypagesController < ApplicationController
  def show
    @user = current_user
    @gifts = @user.gifts
  end
end
