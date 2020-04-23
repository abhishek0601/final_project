class MenuItemsController < ApplicationController
  before_action :ensure_user_logged_in

  def index
  end

  def create
    menu_item = MenuItem.create!(
      name: params[:name],
      description: params[:description],
      price: params[:price],
    )
    render plain: "Menu Item has been created succesfully"
  end

  def destroy
    menu_item_id = params[:id]
    menu_item = MenuItem.find(menu_item_id)
    menu_item.destroy
    redirect_to menus_path
  end

  def home
    render "home"
  end
end
