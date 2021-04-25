class User < ApplicationRecord
    has_secure_password

    has_many :items
    #has_many :categories, through: :items

    has_many :bids
    has_many :posted_items, through: :bids,
        source: :item

    validates :username, :email, presence: true

end
