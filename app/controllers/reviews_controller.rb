class ReviewsController < ApplicationController
  before_action :set_seller, only: %i[new create edit update destroy]
  before_action :set_review, only: %i[edit update destroy]
  before_action :review_params, only: %i[create update]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params.merge(seller_user_params))

    if @review.save
      redirect_to @seller
    else
      render 'new'
    end
  end

  def edit
  
  # binding.pry
  
  end

  def update
    if @review.update(review_params)
      redirect_to @seller
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy

    redirect_to @seller
  end

  private

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
