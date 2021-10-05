class Students::RegistrationsController < Devise::RegistrationsController

  def after_update_path_for(resource)
    student_path(current_student.id)
  end

end
