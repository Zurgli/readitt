class Comment < ApplicationRecord
  # Direct associations

  has_many   :c_votes,
             :dependent => :destroy

  belongs_to :post,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :body, :presence => true

end
