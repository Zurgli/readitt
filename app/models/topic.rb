class Topic < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :subject, :uniqueness => true

  validates :subject, :presence => true

end
