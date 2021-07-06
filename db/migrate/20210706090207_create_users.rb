class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :khmer_name, null: false
      t.string :english_name
      t.string :position
      t.string :address
      t.string :primary_phone_number
      t.string :secondary_phone_number
      t.string :email
      t.string :gender
      t.string :nickname
      t.string :s2_id

      t.timestamps
    end
  end
end
