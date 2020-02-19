class ProductsController < ApplicationController
  skip_before_action :change_locale
  skip_before_action :authenticate_user!, if: :skip_policy_view
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
                elsif current_user.present?
                  Product.per_college(current_user)
                else
                  set_for_college_or_seller
                end

    set_for_category_or_seller
    set_for_search

    @products = @products.page(params[:page]).per(8)
  end

  def show
    return if restricted_area? || current_user.nil?

    @order_product = OrderProduct.find_or_initialize_by(
      product_id: params[:id],
      order_id: nil,
      user_id: current_user.id
    )
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

  def skip_policy_view
    params[:action] == 'show' || params[:college_id].present? ||
      params[:seller_id].present?
  end

  def set_for_search
    return unless params[:search].present?

    @products = @products.where('products.name LIKE ?',
                                "%#{params[:search][:word]}%")
  end

  def set_for_category_or_seller
    if params[:category_id]
      set_for_category
    elsif params[:seller_id]
      set_for_seller
    end
  end

  def set_for_college_or_seller
    @products = Product.all

    if params[:college_id]
      set_for_college
    elsif params[:seller_id]
      set_for_seller
    end
  end

  def set_for_category
    cat = Category.find(params[:category_id])
    @title = I18n.t('others.title.products_of_category', category: cat.name)
    @products = @products.where(category_id: params[:category_id])
  end

  def set_for_seller
    seller = Seller.find(params[:seller_id])
    @title = I18n.t('others.title.products_of_seller', seller: seller.name)
    @products = @products.where(seller_id: params[:seller_id])
  end

  def set_for_college
    college = College.find(params[:college_id])

    @title = I18n.t('others.title.products_of_college', college: college.name)
    @products = @products.joins(seller: [user: [college_has_course: [:college]]])
                         .where(sellers: {
                                  users: {
                                    college_has_courses: {
                                      college_id: params[:college_id]
                                    }
                                  }
                                })
  end

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
    params.require(:product).permit(:name, :image, :price,
                                    :description, :category_id)
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
