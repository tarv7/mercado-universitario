class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :policy_show, only: %i[show]
  before_action :policy_write, only: %i[new create edit update destroy]
  before_action :policy_update_delete, only: %i[edit update destroy]

  def index
    @products = if restricted_area?
                  current_actor.products
                else
                  Product.all
                end
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

  def policy_show
    return if !restricted_area? ||
              @product.seller == current_actor

    redirect_to root_path
  end

  def policy_write
    return if restricted_area?

    redirect_to root_path
  end

  def policy_update_delete
    return if @product.seller == current_actor

    redirect_to root_path
  end
end
