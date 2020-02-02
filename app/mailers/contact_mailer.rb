class ContactMailer < ApplicationMailer
  def create
    @email = params[:email]
    @subject = params[:subject]
    @body = params[:body]

    mail to: 'mercado.universitario.uesc@gmail.com',
         from: @email, subject: @subject
  end
end
