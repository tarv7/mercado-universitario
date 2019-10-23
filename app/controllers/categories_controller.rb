class CategoriesController < ApplicationController
  def index
    @categories = Category.page(params[:page]).per(8)
  end
end
