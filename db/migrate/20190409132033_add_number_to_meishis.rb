class AddNumberToMeishis < ActiveRecord::Migration[5.2]
  def change
    add_column :meishis, :number, :string
  end
end
