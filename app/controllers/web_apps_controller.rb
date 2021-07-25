class WebAppsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]

  def index
    @web_apps = WebApp.includes(:user).order('created_at DESC').page(params[:page]).per(3)
  end

  def new
    @web_app = WebApp.new
  end

  def create
    @web_app = WebApp.new(web_app_params)
    if @web_app.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show 
    @web_app = WebApp.find(params[:id])
  end
  
  private
  def web_app_params
    params.require(:web_app).permit(:name, :description, :language, :free, :link, :edit_count, :image).merge(user_id: current_user.id)
  end
end