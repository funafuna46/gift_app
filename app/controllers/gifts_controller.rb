class GiftsController < ApplicationController
  def index
    @q = Gift.ransack(params[:q])
    @gifts = @q.result(distinct: true).where(public_status: true).includes(:user, :recipient_category).order(created_at: :desc)
    @template_gifts = GiftCardTemplate.where(has_message: true)
    @all_gifts = @gifts # + @template_gifts 一旦テンプレートギフト券を一覧に表示しないでおく
  end

  def show
    @gift = Gift.find(params[:id])
  end
end
