class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      flash[:success] = "Logged-in Succesfully"
      session[:current_user_id] = user.id
      redirect_to new_menu_items_home_path
    else
      flash[:error] = "Your Login attempt was invalid.Please Retry"
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end
end
