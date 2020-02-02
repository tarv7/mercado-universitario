class PublicController < ApplicationController
  skip_before_action :authenticate_user!

  def about; end

  def contact; end

  def send_contact
    contact_params = params[:contact]
    ContactMailer.with(email: contact_params[:email],
                       subject: contact_params[:subject],
                       body: contact_params[:body]).create.deliver_later

    flash[:notice] = 'Email enviado com sucesso'
    redirect_to contact_path
  end
end
