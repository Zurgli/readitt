class Post < ApplicationRecord
  # Direct associations

  has_many   :votes,
             :class_name => "PVote",
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  belongs_to :topic,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :body, :presence => true

  validates :title, :presence => true

end
