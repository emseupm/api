class Api::IdeasController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @ideas = Idea.published.free
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

  def destroy
    idea = current_user.ideas.find params[:id]
    idea.destroy
    render json: idea
  end

  def buy
    idea = Idea.published.find params[:id]
    idea.update buyer: current_user
    render json: idea
  end

  def accept
    idea = Idea.published.find params[:id]
    buyer = idea.buyer
    idea.update user: buyer, buyer: nil, published: false
    render json: idea
  end

  def reject
    idea = Idea.published.find params[:id]
    idea.update buyer: nil
    render json: idea
  end

  private

  def idea_params
    params.permit(:name, :description, :keywords, :published)
  end

end
