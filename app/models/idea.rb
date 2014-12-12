class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :buyer, class_name: 'User'
  has_many :votes

  scope :published, -> { where(published: true) }
  scope :free, -> { where(buyer: nil) }

  def voted?(user)
    votes.where(user: user).exists?
  end
end
