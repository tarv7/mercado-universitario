require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  context 'Logged as user' do
    login_user

    it 'return success' do
      seller = create :seller

      get :new, params: { seller_id: seller.id }

      assert_response :success
    end

    it '#CREATE - return success' do
      seller = create :seller
      review_params = attributes_for :review

      expect do
        post :create, params: { review: review_params, seller_id: seller.id }
      end.to change(Review, :count).by(1)

      expect(response).to redirect_to Seller.last
    end

    it '#EDIT - return success' do
      seller = create :seller
      review = create :review, user_id: @user.id, seller_id: seller.id

      get :edit, params: { id: review.id, seller_id: review.seller.id }

      assert_response :success
    end

    it '#UPDATE - return success' do
      seller = create :seller
      review = create :review, user_id: @user.id, seller_id: seller.id

      put :update, params: { id: review.id, seller_id: seller.id,
                             review: { comment: 'blablabla' } }

      seller.reload
      review.reload
      expect(response).to redirect_to seller
      expect(review.comment).to eq('blablabla')
    end

    it '#DESTROY - return success' do
      seller = create :seller
      review = create :review, user_id: @user.id, seller_id: seller.id

      expect do
        delete :destroy, params: { id: review.id, seller_id: seller.id }
      end.to change(Review, :count).by(-1)

      expect(response).to redirect_to seller
    end
  end
end
