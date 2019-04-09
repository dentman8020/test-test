class AddInstaToMeishis < ActiveRecord::Migration[5.2]
  def change
    add_column :meishis, :insta, :string
  end
end
