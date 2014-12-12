class Api::CommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user!
  
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find params[:id]
  end

  def create
    idea = Idea.find params[:idea_id]
    comment = idea.comments.create(
      comment: params[:comment],
      user: current_user
    )
    render json: comment
  end

  def destroy
    comment = Comment.find params[:id]
    if comment
      comment.destroy
    end
    render json: comment
  end
end
