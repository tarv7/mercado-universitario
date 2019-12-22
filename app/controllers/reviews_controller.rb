class ReviewsController < ApplicationController
  before_action :define_nav_active, only: %i[index show new edit]
  before_action :set_seller, only: %i[new create edit update destroy]
  before_action :set_review, only: %i[edit update destroy]
  before_action :review_params, only: %i[create update]
  before_action :policy_create, only: %i[new create]
  before_action :policy_update_destroy, only: %i[edit update destroy]
  before_action :policy_self

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params.merge(seller_user_params))

    if @review.save
      flash[:notice] = I18n.t('review.flash.notice.create')
      redirect_to @seller
    else
      flash[:alert] = I18n.t('review.flash.alert.create')
      render 'new'
    end
  end

  def edit; end

  def update
    if @review.update(review_params)
      flash[:notice] = I18n.t('review.flash.notice.update')
      redirect_to @seller
    else
      flash[:alert] = I18n.t('review.flash.alert.update')
      render 'edit'
    end
  end

  def destroy
    @review.destroy

    flash[:notice] = I18n.t('review.flash.notice.destroy')
    redirect_to @seller
  end

  private

  def policy_self
    redirect_to @seller if @seller == current_user.seller
  end

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

  def policy_create
    return if current_user.reviews.empty? && restricted_area? == false

    flash[:alert] = I18n.t('review.flash.policy.create')
    redirect_to products_path
  end

  def policy_update_destroy
    return if current_user.reviews.any? && restricted_area? == false

    flash[:alert] = I18n.t('review.flash.policy.update_destroy')
    redirect_to products_path
  end
end
