class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :place
  belongs_to :day

  with_options presence: true do
    validates :title
    validates :text
    validates :image
    validates :price, numericality: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :status_id
      validates :postage_id
      validates :place_id
      validates :day_id
    end
  end
end
