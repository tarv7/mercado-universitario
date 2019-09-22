class RestrictedAreaController < ApplicationController
  def change
    session[:restricted_area] ^= true

    if current_user.seller?
      redirect_to root_path
    else
      redirect_to new_seller_path
    end
  end
end
