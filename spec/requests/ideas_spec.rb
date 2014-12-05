require 'rails_helper'

describe '/api/ideas requests', type: :request do

  context 'failing requests' do
    it 'needs authentication' do
      get '/api/ideas.json'
      expect(response.status).to be(401)
    end
  end

  context 'successful requests' do
    let(:current_user) { FactoryGirl.create :user}

    before(:each) do
      login_as current_user, scope: :user
    end

    let(:idea_user) { User.create email: "vero@vero.com", 
                                  password: "veronica",
                                  first_name: "veronica",
                                  last_name: "brynza"}

    it 'returns HTTP 200' do
      get '/api/ideas.json'
      expect(response.status).to be(200)
    end

    it 'returns json response' do
      get '/api/ideas.json'
      expect(response.content_type).to eq('application/json')
    end

    it 'returns an empty json array if there are no Ideas' do
      get '/api/ideas.json'
      json = JSON.parse response.body
      expect(json).to be_empty
    end

    it 'returns an array with a single Idea when there is one in the DB' do
      Idea.create name: 'Super awesome idea', user: idea_user

      get '/api/ideas.json'
      json = JSON.parse response.body

      expect(json.count).to be(1)
    end

    context 'returns object attributes' do
      let(:idea_name) { 'Super awesome idea' }
      let(:idea_desc) { 'Yes, my idea is awesome =)' }
      let(:idea_keyword) { "Vero key" }
      let(:idea) { Idea.create name: idea_name, 
                               description: idea_desc,
                               user: idea_user,
                               keyword: idea_keyword}
   
      let(:idea_json) do
        idea # trigger object creation
        get '/api/ideas.json'
        json = JSON.parse response.body, symbolize_names: true
        json.first
      end

      it ':id' do
        expect(idea_json[:id]).to eq(idea.id)
      end

      it ':name' do
        expect(idea_json[:name]).to eq(idea.name)
      end

      it ':description' do
        expect(idea_json[:description]).to eq(idea.description)
      end
    
      it ':owner.id' do
        expect(idea_json[:owner][:id]).to eq(idea.user.id)
      end
      it ':owner.first_name' do
        expect(idea_json[:owner][:first_name]).to eq(idea.user.first_name)
      end
      it ':owner.last_name' do
        expect(idea_json[:owner][:last_name]).to eq(idea.user.last_name)
      end
      it ':owner.email' do
        expect(idea_json[:owner][:email]).to eq(idea.user.email)
      end

      it ':owner.phone' do
        expect(idea_json[:owner][:phone]).to eq(idea.user.phone)
      end


      it ':keyword' do
        expect(idea_json[:keyword]).to eq(idea.keyword)
      end

      it 'does not include any other attribute' do
        expect(idea_json.keys).to eq([ :id, :name, :description, 
                                       :owner, :keyword ])
      end
    end
    it 'returns HTTP 200 on post' do
      post '/api/ideas.json'
      expect(response.status).to be(200)
    end 

    it 'returns json response' do
      post '/api/ideas.json'
      expect(response.content_type).to eq("application/json")
    end

    it 'creates a new idea' do
      post 'api/ideas.json'
      expect(Idea.count).to be(1)
    end

    it 'creates a new idea with a name attr' do
      post 'api/ideas.json', :name => "new_idea"
      idea = Idea.first
      expect(Idea.where(name: idea.name)).to_not be_empty
    end
  
    it 'creates a new idea with a name attr' do
      post 'api/ideas.json', :name => "new_idea"
      idea = Idea.first
      expect(Idea.where(name: idea.name)).to_not be_empty
    end

    context 'private ideas' do
      it 'return empty if the user has no ideas' do
        another_user = FactoryGirl.create :user
        idea = Idea.create name: 'Awesome Idea', user: another_user
        get 'api/ideas/mine.json'
        json = JSON.parse response.body
        expect(json).to be_empty
      end
    end
  end
end
  

