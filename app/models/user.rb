class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :email, presence: true, uniqueness: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX}
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :main_family_name, presence:true, format: { with: VALID_NAME_REGEX}
  validates :main_first_name, presence:true, format: { with: VALID_NAME_REGEX}
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :main_family_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX}
  validates :main_first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX}
  validates :birth_day, presence: true
end
