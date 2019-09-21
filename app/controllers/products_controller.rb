class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  # before_action :permission_read, only: %i[index show]
  before_action :permission_write, only: %i[new create edit update destroy]
  before_action :permission_delete, only: %i[destroy]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = current_actor.products.new(product_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end 
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  rescue StandardError
    nil
  end

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end

  def permission_write
    return if current_actor.is_a?(Seller)
  end

  def permission_delete
    return if @product.seller == current_actor
  end
end