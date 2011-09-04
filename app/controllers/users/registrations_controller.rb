# override devise registrations_controller
# from github.com/plataformatec/devise/blob/master/app/controllers/devise/registrations_controller

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    resource = build_resource({})

    respond_with_navigational(resource){
      render_with_scope :new
    }
  end
end
