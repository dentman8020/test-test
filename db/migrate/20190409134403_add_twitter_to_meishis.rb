class AddTwitterToMeishis < ActiveRecord::Migration[5.2]
  def change
    add_column :meishis, :twitter, :string
  end
end
