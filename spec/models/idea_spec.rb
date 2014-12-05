require 'rails_helper'

describe Idea, type: :model do

  it 'can be instantiated' do
    expect(Idea.new).to_not be_nil
  end


  context 'create ideas' do
    let(:idea_name) { "Awesome idea" }
    let(:idea_desc) { " Yes, my idea is awesome =)" }
    let(:idea_email) { "imawesome@awesomness.com" }
    let(:idea_owner) {" I own this shit "}
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
    it '.email' do  
      idea = Idea.create(name: idea_name, 
                         description: idea_desc,
                         email: idea_email)
      
      expect(idea.email).to eq(idea_email)
    end 
    it '.owner' do  
      idea = Idea.create(name: idea_name, 
                         description: idea_desc,
                         email: idea_email,
                         owner: idea_owner)
      
      expect(idea.owner).to eq(idea_owner)
    end 
    it '.keywords' do  
      idea = Idea.create(name: idea_name, 
                         description: idea_desc,
                         email: idea_email,
                         owner: idea_owner,
                         keyword: idea_keyword)
      
      expect(idea.keyword).to eq(idea_keyword)
    end 
  end
end
