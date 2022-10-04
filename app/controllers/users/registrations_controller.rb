class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed
  end

  def register_success
    respond_to do |format|
      if format.html
        redirect_to admins_path
      else
        format.json { render json: { message: "Signed up." } }
      end
    end
  end

  def register_failed
    respond_to do |format|
      format.html 
      format.json { render json: { message: "Signed up failure." } }
    end
  end
end
