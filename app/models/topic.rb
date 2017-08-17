class Topic < ApplicationRecord
  # Direct associations

  has_many   :posts,
             :dependent => :destroy

  has_many   :subscriptions,
             :dependent => :destroy

  # Indirect associations

  has_many   :subscribers,
             :through => :subscriptions,
             :source => :user

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

  validates :subject, :uniqueness => true

  validates :subject, :presence => true

end
