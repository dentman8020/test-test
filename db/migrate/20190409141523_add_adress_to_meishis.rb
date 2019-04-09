class AddAdressToMeishis < ActiveRecord::Migration[5.2]
  def change
    add_column :meishis, :address, :string
  end
end
