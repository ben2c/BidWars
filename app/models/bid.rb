class Bid < ApplicationRecord
    belongs_to :user
    belongs_to :item

    validates :price, presence: true, numericality: { only_integer: true }
end
