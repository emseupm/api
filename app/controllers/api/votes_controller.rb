class Api::VotesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user!

  def index
    render json: nil
  end

  def create
    idea = Idea.find params[:idea_id]

    if idea.voted? current_user
      render nothing: true, status: 403
    else
      idea.votes.create user: current_user
      render json: nil
    end
  end
end
