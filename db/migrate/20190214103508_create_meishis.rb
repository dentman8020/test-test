class CreateMeishis < ActiveRecord::Migration[5.2]
  def change
    create_table :meishis do |t|
      t.string :name
      t.text :intro
      t.text :line
      t.text :twitter
      t.text :insta
      t.text :facebook
      t.text :url
      
      t.timestamps
    end
  end
end
