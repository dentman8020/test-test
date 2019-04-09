class AddLinkedlnToMeishis < ActiveRecord::Migration[5.2]
  def change
    add_column :meishis, :linkedln, :string
  end
end
