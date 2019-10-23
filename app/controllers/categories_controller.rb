class CategoriesController < ApplicationController
  def index
    @categories = Category.page(params[:page]).per(8)

    params[:nav_active] = 'products'
  end
end
