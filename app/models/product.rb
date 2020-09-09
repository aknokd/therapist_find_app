class Product < ApplicationRecord
  belongs_to :therapist
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :qualification
  belongs_to_active_hash :prefecture
end
