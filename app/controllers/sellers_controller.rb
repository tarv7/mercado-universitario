class SellersController < ApplicationController
  before_action :set_seller, only: %i[show edit update destroy]
  before_action :policy_index, only: %i[index]
  before_action :policy_create, only: %i[new create]
  before_action :policy_update_destroy, only: %i[edit update destroy]

  def index
    @sellers = Seller.all
  end

  def show; end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params.merge(user_id: current_user.id))

    if @seller.save
      session[:restricted_area] = true
      redirect_to @seller
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @seller.update(seller_params)
      redirect_to @seller
    else
      render 'edit'
    end
  end

  def destroy
    @seller.destroy

    session[:restricted_area] = false
    redirect_to root_path
  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
  rescue StandardError
    nil
  end

  def seller_params
    params.require(:seller).permit(:name, :category_id)
  end

  def policy_index
    return unless restricted_area?

    redirect_to root_path
  end

  def policy_create
    return unless current_user.seller?

    redirect_to root_path
  end

  def policy_update_destroy
    return if current_user.seller == @seller && restricted_area?

    redirect_to root_path
  end
end
