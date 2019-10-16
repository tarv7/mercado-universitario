module SellerHelper
  def url_whatsapp_path(seller)
    "https://api.whatsapp.com/send?phone=55#{seller.whatsapp}
    &text=[Mercado Universitário] Olá! Me chamo #{current_user.name}."
  end

  def url_instagram_path(seller)
    "https://instagram.com/#{seller.instagram}"
  end
end
