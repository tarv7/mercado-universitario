require 'rails_helper'

RSpec.describe RestrictedAreaController, type: :controller do
  login_user

  context 'When the user is already a seller' do
    login_user

    it 'redirect to page orders' do
      create :seller, user_id: @user.id

      get :change

      expect(response).to redirect_to orders_path
    end
  end

  context 'When the user is not a seller' do
    login_user

    it 'redirect to page new seller' do
      get :change

      expect(response).to redirect_to new_seller_path
    end
  end

  it 'inverts the session variable' do
    session[:restricted_area] = true

    get :change

    expect(session[:restricted_area]).to eq(false)
  end
end
