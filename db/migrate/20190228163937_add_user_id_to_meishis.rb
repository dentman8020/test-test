class AddUserIdToMeishis < ActiveRecord::Migration[5.2]
  def change
    add_column :meishis, :user_id, :integer
  end
end
