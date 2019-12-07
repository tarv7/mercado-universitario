class RegistrationsController < Devise::RegistrationsController
  def edit
    my_college = resource.college

    @universities = University.all
    @university_id = my_college.university_id

    @colleges = College.where(university_id: @university_id)
    @college_id = my_college.id

    @courses = my_college.college_has_courses.map do |cc|
      [cc.course.name, cc.id]
    end
    @college_has_course_id = resource.college_has_course_id

    super
  end

  protected

  def after_update_path_for(_resource)
    products_path
  end
end
