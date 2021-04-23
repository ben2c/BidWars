class Item < ApplicationRecord
  belongs_to :user
  #belongs_to :category
  has_many :bids
  has_many :users, through: :bids

  scope :alpha, -> { order(:title) }

end
