class RestrictedAreaController < ApplicationController
  def change
    # Usando operador xor para inveter boolean
    session[:restricted_area] ^= true

    # Caso não seja um vendedor, levará para form que cria um
    if current_user.seller?
      redirect_to orders_path
    else
      redirect_to new_seller_path
    end
  end
end
