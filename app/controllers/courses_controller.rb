class CoursesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    respond_to do |format|
      format.html
      format.json do
        college = College.find(params[:college_id])

        response = college.college_has_courses.map do |cc|
          { id: cc.id, name: name(cc.course) }
        end

        render json: response
      end
    end
  end

  private

  def name(course)
    if course.name == '* Não é estudante'
      course.name
    else
      "#{course.name} - #{course.name_shift}"
    end
  end
end
