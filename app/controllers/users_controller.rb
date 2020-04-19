class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
  end

  def create
    user = User.new(
      name: params[:first_name],
      email: params[:email],
      role: params[:role],
      password: params[:password],
    )
    if user.save
      session[:current_user_id] = user.id
      flash[:success] = "Signed-up Successfully!!"
      redirect_to "/"
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def new
    render "users/new"
  end
end
