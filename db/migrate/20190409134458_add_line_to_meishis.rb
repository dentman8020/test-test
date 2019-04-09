class AddLineToMeishis < ActiveRecord::Migration[5.2]
  def change
    add_column :meishis, :line, :string
  end
end
