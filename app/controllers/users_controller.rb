class UsersController < ApplicationController
  before_action :set_user
  before_action :policy_show

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  rescue StandardError
    nil
  end

  def policy_show
    return if restricted_area? || @user == current_user

    flash[:alert] = I18n.t('user.flash.show')
    redirect_to current_actor
  end
end
