class Post < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :body, :presence => true

  validates :title, :presence => true

end
