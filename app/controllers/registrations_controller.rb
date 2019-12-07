class RegistrationsController < Devise::RegistrationsController
  def edit
    @universities = University.all
    @university_id = resource.course.college.university_id

    @colleges = College.where(university_id: @university_id)
    @college_id = resource.course.college_id

    @courses = Course.where(college_id: @college_id)
    @course_id = resource.course_id

    super
  end

  protected

  def after_update_path_for(resource)
    products_path
  end
end
