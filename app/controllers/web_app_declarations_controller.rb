class WebAppDeclarationsController < ApplicationController
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
    @web_app_declaration = WebAppDeclaration.find(params[:id])
  end

  def web_app_declaration_params
    params.require(:web_app_declaration).permit(:name, :description, :days, :image).merge(user_id: current_user.id)
  end
end
