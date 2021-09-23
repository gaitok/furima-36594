class Order < ApplicationRecord
  belongs_to :buy

  validates :postcode,  presence: true
  validates :place_id,  presence: true
  validates :city,      presence: true
  validates :block,     presence: true
  validates :building,  presence: true
  validates :phone,     presence: true
  
end
