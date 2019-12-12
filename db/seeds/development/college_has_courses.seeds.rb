after :colleges, :courses do
  CollegeHasCourse.find_or_create_by!(college: College.first , course: Course.second)
  CollegeHasCourse.find_or_create_by!(college: College.first , course: Course.third)
  CollegeHasCourse.find_or_create_by!(college: College.second , course: Course.first)
  CollegeHasCourse.find_or_create_by!(college: College.third , course: Course.last)
  CollegeHasCourse.find_or_create_by!(college: College.first , course: Course.first)
  CollegeHasCourse.find_or_create_by!(college: College.second , course: Course.third)
  CollegeHasCourse.find_or_create_by!(college: College.third , course: Course.second)
  CollegeHasCourse.find_or_create_by!(college: College.third , course: Course.first)
end