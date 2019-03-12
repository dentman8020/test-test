class CreateMeishis < ActiveRecord::Migration[5.2]
  def change
    create_table :meishis do |t|
      t.string :name
      t.text :intro
      t.text :account1_photo
      t.text :account1_info
      t.text :account1_display
      t.text :account2_photo
      t.text :account2_info
      t.text :account2_display
      t.text :account3_photo
      t.text :account3_info
      t.text :account3_display
      t.text :account4_photo
      t.text :account4_info
      t.text :account4_display
      t.text :key
      t.integer :created_user
      t.timestamps
    end
  end
end
