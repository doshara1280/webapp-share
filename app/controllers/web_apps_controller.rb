class WebAppsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find, only: [:show, :edit, :update]
  before_action :move_to_top, only: [:edit, :update]

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
  end
  
  def edit
  end

  def update
    if @web_app.update(web_app_params)
      redirect_to web_app_path(@web_app.id)
    else
      render :edit
    end
  end

  private
  def web_app_params
    params.require(:web_app).permit(:name, :description, :language, :free, :link, :edit_count, :image).merge(user_id: current_user.id)
  end

  def find
    @web_app = WebApp.find(params[:id])
  end

  def move_to_top
    if current_user.id != @web_app.user.id
      redirect_to root_path
    end
  end
end