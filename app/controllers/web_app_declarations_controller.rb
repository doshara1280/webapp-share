class WebAppDeclarationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :find, only: [:show, :destroy]

  def index
    @web_app_declarations = WebAppDeclaration.includes(:user).order('created_at DESC').page(params[:page]).per(8)
  end

  def new
    @web_app_declaration = WebAppDeclaration.new
  end

  def create
    @web_app_declaration = WebAppDeclaration.new(web_app_declaration_params)
    if @web_app_declaration.save
      redirect_to web_app_declarations_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @web_app_declaration.destroy
    redirect_to web_app_declarations_path
  end

  private
  def web_app_declaration_params
    params.require(:web_app_declaration).permit(:name, :description, :days, :image).merge(user_id: current_user.id)
  end

  def find
    @web_app_declaration = WebAppDeclaration.find(params[:id])
  end
end
