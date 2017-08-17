class CVote < ApplicationRecord
  # Direct associations

  belongs_to :comment,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
