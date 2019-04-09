class AddWebsite1ToMeishis < ActiveRecord::Migration[5.2]
  def change
    add_column :meishis, :website1, :string
  end
end
