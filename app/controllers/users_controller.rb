class UsersController < ApplicationController
  before_action :ensure_user_logged_in

  def index
    render "index"
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      role: "customer",
      phone_number: params[:phone_number],
      address: params[:address],
      password: params[:password],
    )
    if user.save
      session[:current_user_id] = user.id
      flash[:success] = "Signed-up Successfully!!"
      redirect_to new_users_home_path
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_sessions_path
    end
  end

  def new
    render "users/new"
  end

  def home
    render "home"
  end
end
