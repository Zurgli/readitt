class Topic < ApplicationRecord
  # Direct associations

  has_many   :subscriptions,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

  validates :subject, :uniqueness => true

  validates :subject, :presence => true

end
