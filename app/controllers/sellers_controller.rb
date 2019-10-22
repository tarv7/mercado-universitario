class SellersController < ApplicationController
  before_action :set_seller, only: %i[show edit update destroy]
  before_action :policy_index, only: %i[index]
  before_action :policy_create, only: %i[new create]
  before_action :policy_update_destroy, only: %i[edit update destroy]

  def index
    @sellers = if params[:seller_id]
                 Seller.where(seller_id: params[:seller_id])
               else
                 Seller.per_university(current_user)
               end

    @sellers = @sellers.page(params[:page]).per(8)
  end

  def show
    @my_review = current_user.reviews.find_by(seller_id: params[:id])
  end

  def new
    @seller = Seller.new
  end

  def create
    # Cria um novo vendedor sem persisti-lo no banco, e já associa
    # ele a um usuário
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

    # Como o usuário não é mais um vendedor, sai da área restrita
    session[:restricted_area] = false
    redirect_to root_path
  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
  rescue StandardError
    nil
  end

  # Permite apenas os parâmetros de seller
  def seller_params
    params.require(:seller).permit(:name, :category_id)
  end

  # Só pode ver todos os vendedores se não estiver na área restrita
  def policy_index
    return unless restricted_area?

    redirect_to root_path
  end

  # Só pode criar uma conta de vendedor se o usuário ainda não for um vendedor
  def policy_create
    return unless current_user.seller?

    redirect_to root_path
  end

  # Só pode atualizar o vendedor em questão se o vendedor em questão(setado
  # via parâmetro) for o mesmo do usuário logado e se estiver na área restrita
  def policy_update_destroy
    return if current_user.seller == @seller && restricted_area?

    redirect_to root_path
  end
end
