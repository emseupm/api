class Api::IdeasController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user!

  def all
    if current_user.moderator? || current_user.admin?
      @ideas = Idea.all
      render :index
    else
      render nothing: true, status: 403
    end
  end

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
    if current_user.admin? || current_user.moderator?
        idea = Idea.where(id: params[:id])
    else
        idea = current_user.ideas.where(id: params[:id])
    end

    if not idea.blank?
      idea.destroy
    end
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

  def search
    if "#{params[:query]}".length > 3
      @ideas = Idea.where('name LIKE ? OR description LIKE ? OR keywords LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @ideas = Idea.none
    end

    render :index
  end

  private

  def idea_params
    params.permit(:name, :description, :keywords, :published)
  end

end
