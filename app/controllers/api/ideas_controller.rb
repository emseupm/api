class Api::IdeasController < ApplicationController
  skip_before_filter :verify_authenticity_token
#  before_action :authenticate_user!

  def index
    @ideas = Idea.published
  end

  def show
    @idea = Idea.find params[:id]
  end

  def mine
    @ideas = current_user.ideas
    render :index
  end

  def create
    idea = current_user.ideas.create idea_params
    render json: idea
  end

  def update
    idea = current_user.ideas.find params[:id]
    idea.update idea_params
    render json: idea
  end

  private

  def idea_params
    params.permit(:name, :description, :keyword, :published)
  end

end
