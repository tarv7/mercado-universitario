require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'When logged as user' do
    login_user

    it 'must redirect when logged in with another user' do
      user = create :user

      get :show, params: { id: user.id }

      expect(response).to redirect_to @user
    end

    it 'return success when same user logged in' do
      get :show, params: { id: @user.id }

      assert_response :success
    end
  end

  context 'When logged as seller' do
    login_seller

    it 'return success' do
      user = create :user

      get :show, params: { id: user.id }

      assert_response :success
    end
  end
end
