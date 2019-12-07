# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe SellersController, type: :controller do
  context 'When logged as user' do
    login_user

    it '#INDEX - return success' do
      course = create :course, college_id: @user.college.id
      users = create_list :user, 10, course_id: course.id
      users.map { |user| create :seller, user_id: user.id }

      get :index

      assert_response :success
      expect(assigns(:sellers).count).to eq(8)
    end

    it '#SHOW - return success' do
      seller = create :seller

      get :show, params: { id: seller.id }

      assert_response :success
      expect(assigns(:seller)).to_not eq(nil)
    end

    describe '#NEW' do
      login_user

      it 'returns 302 if the user is already a seller' do
        create :seller, user_id: @user.id

        get :new

        expect(response).to redirect_to products_path
      end

      it 'return success if the user is not a seller' do
        get :new

        assert_response :success
        expect(assigns(:seller)).to_not eq(nil)
      end
    end

    describe '#CREATE' do
      login_user

      it 'returns 302 if the user is already a seller' do
        create :seller, user_id: @user.id
        seller_params = attributes_for :seller, user_id: @user.id

        expect do
          post :create, params: { seller: seller_params }
        end.to change(Seller, :count).by(0)

        expect(response).to redirect_to products_path
      end

      it 'return success if the user is not a seller' do
        seller_params = attributes_for :seller, :with_image, user_id: @user.id

        expect do
          post :create, params: { seller: seller_params }
        end.to change(Seller, :count).by(1)

        seller = Seller.last

        expect(response).to redirect_to seller
      end
    end

    describe '#EDIT' do
      login_user

      it 'When try edit another seller' do
        seller = create :seller

        get :edit, params: { id: seller.id }

        expect(response).to redirect_to products_path
      end

      it 'When try edit i self' do
        seller = create :seller, user_id: @user.id

        get :edit, params: { id: seller.id }

        expect(response).to redirect_to products_path
      end
    end

    describe '#UPDATE' do
      login_user

      it 'When try update another seller' do
        seller = create :seller

        put :update, params: { id: seller.id, seller: { name: 'New Name' } }

        seller.reload
        expect(response).to redirect_to products_path
        expect(seller.name).to_not eq('New Name')
      end

      it 'When try update i self' do
        seller = create :seller, user_id: @user.id

        put :update, params: { id: seller.id, seller: { name: 'New Name' } }

        seller.reload
        expect(response).to redirect_to products_path
        expect(seller.name).to_not eq('New Name')
      end
    end

    describe '#DESTROY' do
      login_user

      it 'When try delete another seller' do
        seller = create :seller

        delete :destroy, params: { id: seller.id }

        expect(response).to redirect_to products_path
      end

      it 'When try delete i self' do
        seller = create :seller, user_id: @user.id

        delete :destroy, params: { id: seller.id }

        expect(response).to redirect_to products_path
      end
    end
  end

  context 'Logged as seller' do
    login_seller

    it 'should response redirect' do
      get :index

      expect(response).to redirect_to products_path
    end

    describe '#SHOW' do
      it 'To see i self return success' do
        get :show, params: { id: @seller.id }

        assert_response :success
      end

      it 'To see another seller return redirect' do
        seller = create :seller

        get :show, params: { id: seller.id }

        expect(response).to redirect_to products_path
      end
    end

    it '#NEW - return redirect' do
      get :new

      expect(response).to redirect_to products_path
    end

    it '#CREATE - return redirect' do
      seller_params = attributes_for :seller

      expect do
        post :create, params: { seller: seller_params }
      end.to change(Seller, :count).by(0)

      expect(response).to redirect_to products_path
    end

    describe '#EDIT' do
      login_seller

      it 'Try edit another seller, return redirect' do
        seller = create :seller

        get :edit, params: { id: seller.id }

        expect(response).to redirect_to products_path
      end

      it 'Try edit i self, return success' do
        get :edit, params: { id: @seller.id }

        assert_response :success
      end
    end

    describe '#UPDATE' do
      login_seller

      it 'Try update another seller, return redirect' do
        seller = create :seller

        put :update, params: { id: seller.id, seller: { name: 'New name' } }

        seller.reload
        expect(response).to redirect_to products_path
        expect(seller.name).to_not eq('New name')
      end

      it 'Try update my seller, return success' do
        put :update, params: { id: @seller.id, seller: { name: 'New name' } }

        @seller.reload
        expect(response).to redirect_to @seller
        expect(@seller.name).to eq('New name')
      end
    end

    describe '#DESTROY' do
      login_seller

      it 'Try delete another seller, return redirect' do
        seller = create :seller

        expect do
          delete :destroy, params: { id: seller.id }
        end.to change(Seller, :count).by(0)

        expect(response).to redirect_to products_path
      end

      it 'Try delete my seller, return succcess' do
        expect do
          delete :destroy, params: { id: @seller.id }
        end.to change(Seller, :count).by(-1)

        expect(session[:restricted_area]).to eq(false)
        expect(response).to redirect_to categories_path
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
