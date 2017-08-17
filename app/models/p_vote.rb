class PVote < ApplicationRecord
  # Direct associations

  belongs_to :post,
             :counter_cache => :votes_count

  belongs_to :user,
             :counter_cache => :votes_count

  # Indirect associations

  # Validations

  validates :up, :presence => true

end
