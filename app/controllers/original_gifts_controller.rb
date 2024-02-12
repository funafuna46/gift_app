class OriginalGiftsController < ApplicationController
  # ギフト券作成ページの表示
  def index
    @templates = GiftCardTemplate.where(has_message: false)
    render 'gift_creator'
  end

  # プレビュー機能
  def preview
    gift = Gift.new(gift_params)
    design = GiftCardTemplate.find(gift.design_id)

    image_url = Cloudinary::Uploader.upload(design.image_url,
      overlay: {
        text: "#{gift.recipient} - #{gift.expiration_date}",
        gravity: "south_east",
        y: 20, x: 20,
        font_family: "Arial", font_size: 20, color: "#000000"
      })

    # Turbo Streamを使用してプレビュー画像を更新
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('preview_area',
                                                  partial: 'original_gifts/preview',
                                                  locals: { preview_url: image_url['url'] })
      end
    end
  end

  private

  def gift_params
    params.require(:gift).permit(:recipient, :expiration_date, :design_id)
  end
end
