class OrderMailer < ApplicationMailer
  def create
    @order = params[:order]
    @user = params[:user]
    @seller = @order.seller

    mail to: @seller.user.email,
         subject: "[Mercado Universitário] Novo pedido de #{@user.name}"
  end

  def update
    @order = params[:order]
    @seller = @order.seller
    @user = @order.user

    @details = @order.order_products
                     .map { |op| "* #{op.quantity}x - #{op.product.name}" }
                     .join("\n")

    mail to: @user.email,
         subject: '[Mercado Universitário] Status de compra atualizado'
  end

  def confirmed
    @order = params[:order]
    @seller = @order.seller
    @user = @order.user

    @details = @order.order_products
                     .map { |op| "* #{op.quantity}x - #{op.product.name}" }
                     .join("\n")

    mail to: @seller.user.email,
         subject: '[Mercado Universitário] Entrega confirmada'
  end
end
