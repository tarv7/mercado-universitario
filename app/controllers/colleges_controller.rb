class CollegesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    respond_to do |format|
      format.html { @colleges = College.page(params[:page]).per(6) }
      format.json do
        render json: College.where(university_id: params[:university_id])
      end
    end
  end
end
