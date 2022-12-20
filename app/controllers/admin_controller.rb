class AdminController < ApplicationController
  before_action :require_admin, only: [:panel]
  def panel
  end

  def control_users
  end

  def control_questions
  end
  def require_admin
    
  end
  private
  def require_admin
    if session[:current_user_id].nil?
      redirect_to root_path
    else 
      redirect_to root_path unless User.find_by(id: session[:current_user_id]).role == "admin" 
    end
  end
end
