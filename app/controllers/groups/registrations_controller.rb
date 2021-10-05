class Groups::RegistrationsController < Devise::RegistrationsController

  def after_update_path_for(resource)
    group_path(current_group.id)
  end

end
