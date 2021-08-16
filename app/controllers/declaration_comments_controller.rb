class DeclarationCommentsController < ApplicationController
  def create
    declaration_comment = DeclarationComment.new(declaration_comment_params)
    if declaration_comment.save
      render json: { declaration_comment: declaration_comment }
    else
      @web_app_declaration = @declaration_comment.web_app_declaration
      @declaration_comments = @web_app_declaration.declaration_comments.includes(:user)
      render '@web_app_declaration/show'
    end
  end

  private

  def declaration_comment_params
    params.permit(:sentence, :web_app_declaration_id).merge(user_id: current_user.id)
  end
end
