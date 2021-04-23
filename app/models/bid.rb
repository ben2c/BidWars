class Bid < ApplicationRecord
    belongs_to :user
    belongs_to :item

    validates :price, presence: true, numericality: { only_integer: true }

    #scope :alpha, -> { order(:bid) }
    scope :highest_bidder, -> {order(:price).reverse_order}
end
