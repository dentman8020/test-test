class AddPictureToMeishis < ActiveRecord::Migration[5.2]
  def change
    add_column :meishis, :picture, :string
  end
end
