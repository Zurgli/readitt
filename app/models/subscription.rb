class Subscription < ApplicationRecord
  # Direct associations

  belongs_to :topic,
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

end
