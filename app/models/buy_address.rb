class BuyAddress
  include ActiveModel::Model
  attr_accessor :postcode, :place_id, :city, :block, :building, :phone, :token, :item_id, :user_id

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :place_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, :block, :token, :item_id, :user_id
    validates :phone, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    order = Order.create(postcode: postcode, place_id: place_id, city: city, block: block, building: building, phone: phone,
                         buy_id: buy.id)
  end
end
