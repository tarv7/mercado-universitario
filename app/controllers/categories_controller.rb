class CategoriesController < ApplicationController
  def index
    @categories = Category.page(params[:page]).per(8)

    if params[:search].present?
      @categories = @categories.where('name LIKE ?', "%#{params[:search][:word]}%")
    end

    params[:nav_active] = 'products'
  end
end
