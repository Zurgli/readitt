class Post < ApplicationRecord
  # Direct associations

  belongs_to :topic,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :body, :presence => true

  validates :title, :presence => true

end
