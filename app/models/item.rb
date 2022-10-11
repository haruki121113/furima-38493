class Item < ApplicationRecord

  validates :merchandise_name, presence: true
  validates :merchandise_explanation, presence: true
  validates :merchandise_category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :merchandise_condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :time_to_ship_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :merchandise_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, allow_blank: true }
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :merchandise_category
  belongs_to_active_hash :merchandise_condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :area
  belongs_to_active_hash :time_to_ship

end
