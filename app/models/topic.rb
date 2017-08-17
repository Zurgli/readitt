class Topic < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :presence => true

  validates :subject, :uniqueness => true

  validates :subject, :presence => true

end
