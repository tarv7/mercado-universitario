module ProductHelper
  def relative_products_url
    if params[:category_id].present?
      category_products_path(category_id: params[:category_id])
    elsif params[:seller_id].present?
      seller_products_path(seller_id: params[:seller_id])
    else
      products_path
    end
  end
end
