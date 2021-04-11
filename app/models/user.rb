class User < ApplicationRecord
    has_secure_password

    has_many :items
    has_many :categories, through: :items

    has_many :comments
    has_many :posted_items, through: :comments,
        source: :item
end
