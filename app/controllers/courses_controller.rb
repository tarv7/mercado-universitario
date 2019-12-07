class CoursesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    respond_to do |format|
      format.html
      format.json do
        college = College.find(params[:college_id])

        render json: college.college_has_courses.map do |cc|
          { id: cc.id, name: cc.course.name }
        end
      end
    end
  end
end
