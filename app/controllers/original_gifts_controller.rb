class OriginalGiftsController < ApplicationController
  # ギフト券作成ページの表示
  def index
    @templates = GiftCardTemplate.where(has_message: false)
    render 'gift_creator'
  end

  def create
    @gift = Gift.new(gift_params)
    Rails.logger.debug { "Gift params: #{gift_params.inspect}" }
    Rails.logger.debug { "Gift design_id: #{@gift.design_id}" }
    design = GiftCardTemplate.find(@gift.design_id)

    @gift.user = current_user
    @gift.gift_category = GiftCategory.find_by(category_type: :original)
    @gift.recipient_category = RecipientCategory.find(gift_params[:recipient_category_id])

    # original カテゴリーの GiftCategory を取得
    original_category = GiftCategory.find_by(category_type: :original)
    # GiftCategory を Gift オブジェクトに関連付ける
    @gift.gift_category = original_category

    case params[:commit]
    when 'preview'
      # 同じくCloudinaryを使用して画像を合成
      image_url = Cloudinary::Uploader.upload(design.image_url,
        transformation: [
          {
            overlay: "text:Arial_40:#{@gift.title}",
            gravity: "center",
            color: "#000000"
          },
          {
            overlay: "text:Arial_20:#{@gift.content}",
            gravity: "center",
            y: 50, # Y軸を調整してテキストを中央より下に配置
            color: "#000000"
          }
        ])

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('preview_area',
                                                    partial: 'original_gifts/preview',
                                                    locals: { preview_url: image_url['url'] })
        end
      end

    when 'create'
      # 作成処理
      image_url = Cloudinary::Uploader.upload(design.image_url,
        transformation: [
          {
            overlay: "text:Arial_40:#{@gift.title}",
            gravity: "center",
            color: "#000000"
          },
          {
            overlay: "text:Arial_20:#{@gift.content}",
            gravity: "center",
            y: 50, # Y軸を調整してテキストを中央より下に配置
            color: "#000000"
          }
        ])
      @gift.image_url = image_url['url']
      if @gift.save
        redirect_to gift_path(@gift)
      else
        Rails.logger.debug { @gift.errors.full_messages }
        @templates = GiftCardTemplate.where(has_message: false)
        render 'gift_creator'
      end
    end
  end

  def destroy
    @gift = Gift.find(params[:id])
    if @gift.user == current_user
      @gift.destroy!
      redirect_to mypage_path, status: :see_other, notice: 'ギフト券が削除されました。'
    else
      redirect_to mypage_path, alert: '削除権限がありません。'
    end
  end

  private

  def gift_params
    params.require(:gift).permit(:recipient, :expiration_date, :design_id, :title, :content, :public_status, :recipient_category_id)
  end
end
