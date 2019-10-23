class ReviewsController < ApplicationController
  before_action :define_nav_active, only: %i[index show new edit]
  before_action :set_seller, only: %i[new create edit update destroy]
  before_action :set_review, only: %i[edit update destroy]
  before_action :review_params, only: %i[create update]

  def index; end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params.merge(seller_user_params))

    if @review.save
      flash[:notice] = 'Review cadastrado com sucesso!'
      redirect_to @seller
    else
      flash[:alert] = 'Erro ao cadastrar o review. Tente novamente'
      render 'new'
    end
  end

  def edit; end

  def update
    if @review.update(review_params)
      flash[:notice] = 'Review atualizado com sucesso!'
      redirect_to @seller
    else
      flash[:alert] = 'Erro ao atualizar o review. Tente novamente'
      render 'edit'
    end
  end

  def destroy
    @review.destroy

    flash[:notice] = 'Review excluído com sucesso!'
    redirect_to @seller
  end

  private

  def define_nav_active
    params[:nav_active] = 'sellers'
  end

  def review_params
    params.require(:review).permit(:value, :comment)
  end

  def seller_user_params
    {
      seller_id: params[:seller_id],
      user_id: current_user.id
    }
  end

  def set_seller
    @seller = Seller.find(params[:seller_id])
  end

  def set_review
    @review = current_user.reviews.find_by(seller_id: params[:seller_id])
  end
end
