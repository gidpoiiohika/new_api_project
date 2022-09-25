class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if current_user
      redirect_to admins_path
    else
      respond_to do |format|
        format.html 
        format.json { render json: { message: "Logged." }, status: :ok }
      end
    end
  end

  def respond_to_on_destroy
    current_user ? log_out_success : log_out_failure
  end

  def log_out_success
    respond_to do |format|
      format.json { render json: { message: "Logged out." }, status: :ok }
      format.html { redirect_to after_sign_out_path_for(resource_name), status: :see_other}
    end
    render json: { message: "Logged out." }, status: :ok
  end

  def log_out_failure
    respond_to do |format|
      format.json { render json: { message: "Logged out failure." }, status: :unauthorized }
      format.html { redirect_to after_sign_out_path_for(resource_name), status: :see_other}
    end
  end
end
