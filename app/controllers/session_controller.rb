class SessionController < ApplicationController
  def login
  end

  def authorize
    user = User.find_by(name: params[:name])
    if user.present? && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      if User.find_by(id: session[:current_user_id]).role == "admin" 
        redirect_to admin_panel_path
      else
        redirect_to exam_cabinet_path
      end
    else
      return redirect_to_login 
    end
  end

  def logout
    session[:current_user_id] = nil
    redirect_to root_path
  end

  def redirect_to_login
    redirect_to root_path, flash: { alert: 'Wrong login or password' }
  end
end
