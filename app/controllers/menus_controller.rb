class MenusController < ApplicationController
  before_action :ensure_user_logged_in

  def new
    render "new"
  end

  def create
    menu = Menu.create!(name: params[:name])
    redirect_to menus_path
  end
end
