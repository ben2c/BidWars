class Bid < ApplicationRecord
    belongs_to :user
    belongs_to :item

    validates :price, presence: true, numericality: { only_integer: true }

    scope :alpha, -> { order(:bid) }
    scope :highest_bidder, -> {where(price: self.maximum(:price))}
end
