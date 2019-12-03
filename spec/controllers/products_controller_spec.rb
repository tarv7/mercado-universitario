# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  context 'When logged as user' do
    login_user

    it '#GET - should return success' do
      get :index

      assert_response :success
    end

    it '#SHOW - should return success' do
      product = create :product
      get :show, params: { id: product.id }

      assert_response :success
      expect(assigns(:order_product)).to_not eq(nil)
      expect(assigns(:product)).to eq(product)
    end

    it '#NEW - should return http code 302' do
      get :new

      expect(response).to redirect_to products_path
    end

    it '#CREATE - should return http code 302' do
      product_params = attributes_for :product
      post :create, params: { product: product_params }

      expect(response).to redirect_to products_path
    end

    it '#EDIT - should return http code 302' do
      product = create :product

      get :edit, params: { id: product.id }

      expect(response).to redirect_to products_path
    end

    it '#UPDATE - should return http code 302' do
      product = create :product

      put :edit, params: { id: product.id }

      expect(response).to redirect_to products_path
    end

    it '#DESTROY - should return http code 302' do
      product = create :product

      delete :destroy, params: { id: product.id }

      expect(response).to redirect_to products_path
    end
  end

  context 'When logged as seller' do
    login_seller

    it '#INDEX - should return success' do
      create_list :product, 6
      create_list :product, 4, seller_id: @seller.id

      get :index

      assert_response :success

      expect(assigns(:products)).to eq(@seller.products)
    end

    it '#SHOW - should return success' do
      product = create :product, seller_id: @seller.id

      get :show, params: { id: product.id }

      assert_response :success
      expect(assigns(:product)).to eq(product)
      expect(assigns(:order_product)).to eq(nil)
    end

    it '#NEW - should return success' do
      get :new

      assert_response :success
      expect(assigns(:product)).to_not eq(nil)
    end

    it '#CREATE - should return success' do
      category = create :category
      product_params = attributes_for :product,
                                      :with_image, category_id: category.id

      expect do
        post :create, params: { product: product_params }
      end.to change(Product, :count).by 1

      expect(response).to redirect_to Product.last
    end

    it '#EDIT - should return success' do
      product = create :product, seller_id: @seller.id

      get :edit, params: { id: product.id }

      assert_response :success
      expect(assigns(:product)).to eq(product)
    end

    it '#UPDATE - should return success' do
      product = create :product, seller_id: @seller.id
      product_params = { name: 'Change name' }

      put :update, params: { id: product.id, product: product_params }

      product.reload
      expect(product.name).to eq('Change name')
      expect(response).to redirect_to product
    end

    describe '#DESTROY' do
      it 'should return success' do
        product = create :product, seller_id: @seller.id

        expect do
          delete :destroy, params: { id: product.id }
        end.to change(Product, :count).by(-1)

        expect(response).to redirect_to products_path
      end

      it 'seller logged is not owner of product, should return error' do
        product = create :product

        expect do
          delete :destroy, params: { id: product.id }
        end.to change(Product, :count).by(0)

        assert_response :redirect
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
