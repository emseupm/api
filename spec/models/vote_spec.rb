require 'rails_helper'

describe Vote, type: :model do

  it 'can be instantiated' do
    expect(Vote.new).to_not be_nil
  end

  it '.user' do
  	user = FactoryGirl.create :user
  	vote = Vote.create
  	vote.update user_id: user.id
  	expect(vote.user).to eq(user)
  end
  
  it '.idea' do
  	idea = FactoryGirl.create :idea
  	vote = Vote.create
  	vote.update idea_id: idea.id
  	expect(vote.idea).to eq(idea)
  end

end
