class Item < ApplicationRecord
  belongs_to :user
  has_many :bids
  has_many :users, through: :bids


  validates :description, :title, presence: true
  validate :over_daily_limit

  scope :alpha, -> { order(:title) }

  def over_daily_limit
    today_items = user.items.select do |i|
      i.created_at.try(:to_date) == Date.today
    end

    if today_items.size > 2
      errors.add(:item_id, "can't post due to already posting over 3 items today.")
    end
  end
end
