require 'rails_helper'

describe 'API requests', type: :request do
  context 'successful requests' do
    let(:current_user) { FactoryGirl.create :user}

    before(:each) do
      login_as current_user, scope: :user
    end


    context 'comment requests' do
      let(:comment) { FactoryGirl.create :comment }
      
      it '.id' do
        get '/api/comments/' + comment.id.to_s + '.json'
        json = JSON.parse response.body
        expect(comment.id).to eq(json["id"])
      end
      it '.user' do
        get '/api/comments/' + comment.id.to_s + '.json'
        json = JSON.parse response.body
        expect(comment.user.id).to eq(json["owner"]["id"])
      end
      it '.comment' do
        get '/api/comments/' + comment.id.to_s + '.json'
        json = JSON.parse response.body
        expect(comment.comment).to eq(json["comment"])
      end
  
      it 'deletes comment' do
        delete '/api/comments/' + comment.id.to_s + '.json'
        expect(Comment.where(id: comment.id)).to be_empty
      end
    end
  end
end
