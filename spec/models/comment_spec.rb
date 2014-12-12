require 'rails_helper'

describe Comment, :type => :model do

  it 'can be instantiated' do
    expect(Comment.new).to_not be_nil
  end

  context 'creates a comment' do
    let(:owner) { FactoryGirl.create :user }
    let(:idea) { FactoryGirl.create :idea }
    it '.owner' do
      comment = Comment.create user: owner
      expect(comment.user).to be(owner)
    end
    it '.text' do
      comment = FactoryGirl.create :comment
      text = "My awesome comment"
      comment.comment = text
      expect(comment.comment).to be(text)
    end
    it '.idea' do
      comment = FactoryGirl.create :comment, idea: idea
      expect(comment.idea).to be(idea)
    end
  end
end
