class AddWebsite2ToMeishis < ActiveRecord::Migration[5.2]
  def change
    add_column :meishis, :website2, :string
  end
end
