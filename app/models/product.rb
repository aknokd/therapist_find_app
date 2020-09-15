class Product < ApplicationRecord
  belongs_to :therapist
  has_one_attached :image
  has_many :reservations
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :qualification
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :image
    validates :qualification_id,  numericality: { other_than: 0 }
    validates :prefecture_id,     numericality: { other_than: 0 }
    validates :self_introduction
    validates :price
  end
end
