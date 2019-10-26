class ProductsController < ApplicationController
  before_action :define_nav_active, only: %i[index show new edit]
  before_action :set_product, only: %i[show edit update destroy]
  before_action :policy_show, only: %i[show]
  before_action :policy_write, only: %i[new create edit update destroy]
  before_action :policy_update_delete, only: %i[edit update destroy]

  def index
    # Devolve lista de produtos de acordo com o escopo de permissões
    # Todos produtos para usuários comuns, apenas produtos que sou dono
    # para o vendedor logado
    @products = if restricted_area?
                  current_actor.products
                else
                  Product.per_university(current_user)
                end

    if params[:category_id]
      @products = @products.where(category_id: params[:category_id])
    elsif params[:seller_id]
      @products = @products.where(seller_id: params[:seller_id])
    end

    @products = @products.where('products.name LIKE ?', "%#{params[:search][:word]}%") if params[:search].present?

    @products = @products.page(params[:page]).per(8)
  end

  def show
    @order_product = OrderProduct.find_or_initialize_by(product_id: params[:id],
                                                        order_id: nil,
                                                        user_id: current_user.id)
  end

  def new
    @product = Product.new
  end

  def create
    # Cria um novo produto ainda não persistido dos parâmetros que
    # veio do form
    @product = current_actor.products.new(product_params)

    if @product.save
      redirect_to @product
      flash[:notice] = I18n.t('product.flash.notice.create')
    else
      flash[:alert] = I18n.t('product.flash.alert.create')
      render 'new'
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      flash[:notice] = I18n.t('product.flash.notice.update')
      redirect_to @product
    else
      flash[:alert] = I18n.t('product.flash.alert.update')
      render 'edit'
    end
  end

  def destroy
    @product.destroy

    flash[:notice] = I18n.t('product.flash.notice.destroy')
    redirect_to products_path
  end

  private

  def define_nav_active
    params[:nav_active] = 'products'
  end

  # Seta o produto de acordo com o id que veio na URL
  def set_product
    @product = Product.find(params[:id])
  rescue StandardError
    nil
  end

  # Permite apenas os parâmetros necessários para produto
  def product_params
    params.require(:product).permit(:name, :image, :price, :description, :category_id)
  end

  # Só visualiza o produto se for dono dele ou se for um usuário comum
  def policy_show
    return if !restricted_area? ||
              @product.seller == current_actor

    flash[:alert] = I18n.t('product.flash.policy.show')
    redirect_to products_path
  end

  # Só cria um novo produto se estiver logado como vendedor
  def policy_write
    return if restricted_area?

    flash[:alert] = I18n.t('product.flash.policy.write')
    redirect_to products_path
  end

  # Só pode atualizar o produto se for dono dele
  def policy_update_delete
    return if @product.seller == current_actor

    flash[:alert] = I18n.t('product.flash.policy.update_delete')
    redirect_to @product
  end
end
