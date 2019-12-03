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

  def link_to_change_locale
    if I18n.locale.to_s == 'pt-BR'
      link_to image_tag('eua.svg', width: '25px'),
              change_locale_path(locale: 'en'), class: 'nav-link'
    elsif I18n.locale.to_s == 'en'
      link_to image_tag('brazil.svg', width: '25px'),
              change_locale_path(locale: 'pt-BR'), class: 'nav-link'
    end
  end
end
