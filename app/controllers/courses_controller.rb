class CoursesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    respond_to do |format|
      format.html
      format.json do
        college = College.find(params[:college_id])

        response = college.college_has_courses.map do |cc|
          { id: cc.id, name: cc.course.name }
        end

        render json: response
      end
    end
  end
end
