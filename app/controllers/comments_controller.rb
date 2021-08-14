class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: { comment: comment }
    else
      @web_app = @comment.web_app
      @comments = @web_app.comments.includes(:user)
      render '@web_app/show'
    end
  end

  private

  def comment_params
    params.permit(:sentence, :web_app_id).merge(user_id: current_user.id)
  end
end
