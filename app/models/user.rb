class User < ApplicationRecord
  # Direct associations

  has_many   :c_votes,
             :dependent => :destroy

  has_many   :votes,
             :class_name => "PVote",
             :dependent => :destroy

  has_many   :comments,
             :dependent => :nullify

  has_many   :posts,
             :dependent => :nullify

  has_many   :subscriptions,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  validates :username, :length => { :minimum => 4, :maximum => 40 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
