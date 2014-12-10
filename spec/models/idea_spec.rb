require 'rails_helper'

describe Idea, type: :model do

  it 'can be instantiated' do
    expect(Idea.new).to_not be_nil
  end


  context 'create ideas' do
    let(:idea_name) { "Awesome idea" }
    let(:idea_desc) { " Yes, my idea is awesome =)" }
    let(:idea_user) { User.create email: "vero@vero.com", 
                                  password: "veronica",
                                  first_name: "veronica",
                                  last_name: "brynza"}
    let(:idea_keyword) { "Vero key" }

    it '.name' do
      idea = Idea.create name: idea_name
      expect(idea.name).to eq(idea_name)
    end

    it '.description' do  
      idea = Idea.create(name: idea_name, 
                         description: idea_desc)
      
      expect(idea.description).to eq(idea_desc)
    end 
    it '.user' do  
      idea = Idea.create(name: idea_name, 
                         description: idea_desc)
      
      idea.update user_id: idea_user.id

      expect(idea.user).to eq(idea_user)
    end

    it '.keywords' do  
      idea = Idea.create(name: idea_name, 
                         description: idea_desc,
                         keyword: idea_keyword)
      
      expect(idea.keyword).to eq(idea_keyword)
    end

    it '.votes' do
      idea = FactoryGirl.create :idea
      user = FactoryGirl.create :user
      vote = FactoryGirl.create :vote, user: user, idea: idea
      expect(idea.votes.to_a).to eq([ vote ])
    end 
  end
end
