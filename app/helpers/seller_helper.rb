module SellerHelper
  def url_whatsapp_path(seller)
    "https://api.whatsapp.com/send?phone=55#{seller.whatsapp}
    &text=[Mercado Universitário] Olá! Me chamo #{current_user.name}."
  end

  def url_instagram_path(seller)
    "https://instagram.com/#{seller.instagram}"
  end

  def link_to_review
    if @my_review.present?
      link_to I18n.t('review.link.edit'), edit_seller_review_path(@seller,
                                                                  @my_review)
    else
      link_to I18n.t('review.link.new'), new_seller_review_path(@seller)
    end
  end
end
