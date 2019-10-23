module ApplicationHelper
  def active_nav_products?
    params[:nav_active] == 'products'
  end

  def active_nav_sellers?
    params[:nav_active] == 'sellers'
  end

  def active_nav_orders?
    params[:nav_active] == 'orders'
  end

  def active_nav_configs?
    params[:nav_active] == 'users'
  end
end
