class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :ideas, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum roles: [ :entrepreneur, :moderator, :admin ]
end
