class OrderAddress
  include ActiveModel::Model
  attr_accessor :receiving_postal_code, :area_id, :receiving_municipalities, :receiving_house_number, :receiving_building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :receiving_postal_code
    validates :area_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :receiving_municipalities
    validates :receiving_house_number
    validates :phone_number
    validates :user_id
    validates :item_id
  end

  validates :phone_number, format: {with: /\A[0-9]+\z/}, length: { minimum: 10, maximum: 11 }, allow_blank: true
  validates :receiving_postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にハイフン(-)を入力してください"}, allow_blank: true
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(receiving_postal_code: receiving_postal_code, area_id: area_id, receiving_municipalities: receiving_municipalities,receiving_house_number: receiving_house_number, receiving_building_name: receiving_building_name, phone_number: phone_number, order_id: order.id)
  end
end