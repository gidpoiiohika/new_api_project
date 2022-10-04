class AdminsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @users_count = @users.count
    respond_to do |format|
      format.html 
      format.json { render json: @users }
    end
  end
end
