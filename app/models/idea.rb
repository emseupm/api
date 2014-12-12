class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :buyer, class_name: 'User'
  has_many :comments, dependent: :destroy

  scope :published, -> { where(published: true) }
  scope :free, -> { where(buyer: nil) }
end
