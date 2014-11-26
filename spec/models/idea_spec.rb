require 'rails_helper'

describe Idea, type: :model do

  it 'can be instantiated' do
    expect(Idea.new).to_not be_nil
  end

  it '.name' do
    idea_name = 'Awesome Idea'
    idea = Idea.create name: idea_name

    expect(idea.name).to eq(idea_name)
  end

end
