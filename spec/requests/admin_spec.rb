require 'rails_helper'

describe 'CRUD of users from admin interface', type: :request do
  
  it 'requires authentication' do
    get '/admin'
    expect(response.status).to be(403)
    expect(response.body).to eq('Forbidden')
  end

  it 'Returns 200 if user is admin' do
    user = FactoryGirl.create :admin
    login_as user

    get '/admin'
    expect(response.status).to eq(200)
  end
end
