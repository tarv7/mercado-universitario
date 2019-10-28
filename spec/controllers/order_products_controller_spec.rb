require 'rails_helper'

RSpec.describe OrderProductsController, type: :controller do
  context 'When logged as user' do
    login_user

    it '#CREATE - return success' do
      product = create :product
      op_params = attributes_for :order_product, product_id: product.id

      expect do
        post :create, params: { order_product: op_params }
      end.to change(OrderProduct, :count).by(1)

      expect(response).to redirect_to OrderProduct.last.product
    end

    describe '#PUT' do
      it '#PUT - return success' do
        op = create :order_product, order_id: nil, user_id: @user.id

        put :update, params: { id: op.id,
                              order_product: { product_id: op.product.id,
                                                quantity: 2 } }

        op.reload
        expect(response).to redirect_to op.product
        expect(op.quantity).to eq(2)
      end

      it '#PUT - another user, return redirect' do
        user = create :user
        op = create :order_product, order_id: nil, user_id: user.id

        put :update, params: { id: op.id,
                              order_product: { product_id: op.product.id,
                                                quantity: 222 } }

        op.reload
        expect(op.quantity).to_not eq(222)
      end
    end
  end

  context 'When logged as seller' do
    login_seller

    it '#CREATE - return redirect' do
      product = create :product
      op_params = attributes_for :order_product, product_id: product.id

      expect do
        post :create, params: { order_product: op_params }
      end.to change(OrderProduct, :count).by(0)

      expect(response).to redirect_to products_path
    end

    it '#PUT - return success' do
      op = create :order_product, order_id: nil

      put :update, params: { id: op.id,
                             order_product: { product_id: op.product.id,
                                              quantity: 222 } }

      op.reload
      expect(op.quantity).to_not eq(222)
    end
  end
end
