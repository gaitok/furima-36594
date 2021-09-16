class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
  validates :title
  validates :text 
  validates :category_id
  validates :status_id
  validates :price,numericality: { in: 300..9999999 }
  validates :postage_id
  validates :place_id
  validates :day_id
  end
end
