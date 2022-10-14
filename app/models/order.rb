class Order < ApplicationRecord

  has_one :address
  belongs_to :item
  belongs_to :user

  attr_accessor :token

  # validates :token, presence: true

end
