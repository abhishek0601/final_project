class MenusController < ApplicationController
  def index
    render "index"
  end

  def create
    menu = Menu.create!(name: params[:name])
    redirect_to menus_path
  end
end
