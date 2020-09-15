class Therapist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :product

  with_options presence: true do
    validates :name
    validates :name_kana
    validates :email,                 uniqueness: { case_sensitive: true }
    validates :password,              confirmation: true
    validates :password_confirmation
    validates :gender
    validates :birthday
  end
end
