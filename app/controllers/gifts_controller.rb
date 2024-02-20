class GiftsController < ApplicationController
  def index
    @gifts = Gift.all
    @template_gifts = GiftCardTemplate.where(has_message: true)
    @all_gifts = @gifts + @template_gifts
  end

  def show
    @gift = Gift.find(params[:id])
  end
end
