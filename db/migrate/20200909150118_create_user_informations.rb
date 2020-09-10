class CreateUserInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_informations do |t|
      t.string      :full_name,      null: false
      t.string      :full_name_kana, null: false
      t.string      :gender,         null: false
      t.integer     :age,            null: false
      t.integer     :prefecture_id,  null: false
      t.string      :city,           null: false
      t.string      :address,        null: false
      t.string      :building_name
      t.string      :phone_number,   null: false
      t.references  :product,        null: false,  foreign_key: true
      t.timestamps
    end
  end
end
