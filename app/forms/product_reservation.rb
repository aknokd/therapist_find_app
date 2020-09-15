class ProductReservation
  include ActiveModel::Model
  attr_accessor :full_name, :full_name_kana, :gender, :age, :prefecture_id, :city, :address,
                :building_name, :phone_number, :product_id, :user_id, :datetime

  with_options presence: true do
    validates :datetime
    validates :full_name
    validates :full_name_kana
    validates :gender
    validates :age
    validates :prefecture_id,  numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number
    validates :product_id
    validates :user_id
  end

  def save
    Reservation.create(product_id: product_id, user_id: user_id, datetime: datetime)
    UserInformation.create(full_name: full_name, full_name_kana: full_name_kana, gender: gender, age: age,
                           prefecture_id: prefecture_id, city: city, address: address,
                           building_name: building_name, phone_number: phone_number, product_id: product_id)
  end
end
