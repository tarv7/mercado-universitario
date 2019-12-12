after 'production:colleges', 'production:courses' do
  Course.all.map do |course|
    CollegeHasCourse.find_or_create_by(college: College.first, course: course)
  end
end