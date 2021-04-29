Bid App

What models?

Item
    -belongs_to :user
    -has_many :bids
    -title
    -description

User
    -has_many :items
    -has_many :posted_items, through :bids
    -username
    -email
    -password_digest

Bid
    -belongs_to :user
    -belongs_to :item
    -content

