class MypagesController < ApplicationController
  def show
    @user = current_user
    @gifts = @user.gifts
    @favorite_gifts = @user.favorite_gifts
  end
end
