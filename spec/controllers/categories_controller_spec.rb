require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  login_user

  it '#INDEX - should return success' do
    create_list :category, 5

    get :index

    assert_response :success
    expect(assigns(:categories).count).to eq(4)
  end
end
