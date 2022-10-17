class Item < ApplicationRecord
  
  validates :image, presence: true
  validates :merchandise_name, presence: true
  validates :merchandise_explanation, presence: true
  validates :merchandise_category_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :merchandise_condition_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :area_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :time_to_ship_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :merchandise_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, allow_blank: true }


  has_one :order
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :merchandise_category
  belongs_to_active_hash :merchandise_condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :area
  belongs_to_active_hash :time_to_ship

end
