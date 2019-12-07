class CoursesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    respond_to do |format|
      format.html
      format.json do
        render json: Course.where(college_id: params[:college_id])
      end
    end
  end
end
