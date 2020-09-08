class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer     :qualification_id,  null: false
      t.integer     :prefecture_id,     null: false
      t.text        :self_introduction, null: false
      t.integer     :price,             null: false
      t.references  :therapist,         foreign_key: true
      t.timestamps
    end
  end
end
