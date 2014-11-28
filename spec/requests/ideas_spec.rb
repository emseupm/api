require 'rails_helper'

describe '/api/ideas requests', type: :request do

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
    Idea.create name: 'Super awesome idea'

    get '/api/ideas.json'
    json = JSON.parse response.body

    expect(json.count).to be(1)
  end

  context 'returns object attributes' do
    let(:idea_name) { 'Super awesome idea' }
    let(:idea) { Idea.create name: idea_name }
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

    it 'does not include any other attribute' do
      expect(idea_json.keys).to eq([ :id, :name ])
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
  
end
  

