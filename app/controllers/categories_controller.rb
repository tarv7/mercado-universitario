class CategoriesController < ApplicationController
  def index
    @categories = Category.page(params[:page]).per(2)
  end
end
