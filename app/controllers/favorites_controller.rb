class FavoritesController < ApplicationController
  before_action :set_gift

  def create
    @favorite = current_user.favorites.create(gift: @gift)
  end

  def destroy
    @favorite = current_user.favorites.find_by(gift_id: @gift.id).destroy
  end

  private

  def set_gift
    @gift = Gift.find(params[:gift_id])
  end
end
