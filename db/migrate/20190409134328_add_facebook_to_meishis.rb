class AddFacebookToMeishis < ActiveRecord::Migration[5.2]
  def change
    add_column :meishis, :facebook, :string
  end
end
