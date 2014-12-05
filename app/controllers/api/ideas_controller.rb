class Api::IdeasController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @ideas = Idea.all
  end

  def create
    name = params[:name]
    new_idea = Idea.create name: name
    render json: new_idea 
  end 

end
