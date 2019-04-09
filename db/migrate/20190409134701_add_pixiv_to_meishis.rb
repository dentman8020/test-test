class AddPixivToMeishis < ActiveRecord::Migration[5.2]
  def change
    add_column :meishis, :pixiv, :string
  end
end
