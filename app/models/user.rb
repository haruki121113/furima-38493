class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, confirmation: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX, allow_blank: true}
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates :main_family_name, presence:true, format: { with: VALID_NAME_REGEX, allow_blank: true}
  validates :main_first_name, presence:true, format: { with: VALID_NAME_REGEX, allow_blank: true}
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :main_family_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX, allow_blank: true}
  validates :main_first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX, allow_blank: true}
  validates :birth_day, presence: true

  has_many :items

end
