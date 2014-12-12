require 'rails_helper'

describe '/api/votes requests', type: :request do

  context 'failing requests' do
    it 'needs authentication' do
      idea = FactoryGirl.create :idea
      get "/api/ideas/#{idea.id}/votes.json"
      expect(response.status).to be(401)
    end
  end

  context 'successful requests' do
    let(:current_user) { FactoryGirl.create :user}

    before(:each) do
      login_as current_user, scope: :user
    end

    it 'returns HTTP 200' do
      idea = FactoryGirl.create :idea
      get "/api/ideas/#{idea.id}/votes.json"
      expect(response.status).to be(200)
    end

    context 'create' do
      let(:idea) { FactoryGirl.create :idea }

      before(:each) do
        idea.votes.delete_all
        post "/api/ideas/#{idea.id}/votes.json"
      end

      it do
        expect(response.status).to be(200)
      end

      it 'creates a new vote for the idea' do
        expect(idea.votes.count).to be(1)
      end

      it 'associates the created vote to the current_user' do
        expect(idea.votes(true).first.user).to eq(current_user)
      end

      it 'does not allow a user to vote twice for the same idea' do
        post "/api/ideas/#{idea.id}/votes.json"
        expect(response.status).to be(403)
      end
    end
  end

end
