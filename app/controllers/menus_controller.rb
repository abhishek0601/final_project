class MenusController < ApplicationController
  before_action :ensure_user_logged_in

  def index
    render "index"
  end

  def create
    new_menu = Menu.new(
      name: params[:name],
    )
    if new_menu.save
      redirect_to menus_path
    else
      flash[:error] = new_menu.errors.full_messages.join(", ")
      redirect_to menus_path
    end
  end

  def destroy
    id = params[:id]
    menu = Menu.all.find(id)
    menu.destroy
    redirect_to menus_path
  end
end
