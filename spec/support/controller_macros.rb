module ControllerMacros
  def login_seller
    before(:each) do
      @seller = FactoryBot.create(:seller)
      @request.env['devise.mapping'] = Devise.mappings[:user]
      session[:restricted_area] = true
      sign_in @seller.user # Using factory bot as an example
    end
  end

  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @user = FactoryBot.create(:user)
      # user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in @user
    end
  end
end
