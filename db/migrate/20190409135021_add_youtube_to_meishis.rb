class AddYoutubeToMeishis < ActiveRecord::Migration[5.2]
  def change
    add_column :meishis, :youtube, :string
  end
end
