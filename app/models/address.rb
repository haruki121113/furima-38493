class Address < ApplicationRecord

  belongs_to :order

  #validates :receiving_postal_code, presence: true
  #validates :area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  #validates :receiving_municipalities, presence: true
  #validates :receiving_house_number, presence: true
  #validates :phone_number, null:false
  
end