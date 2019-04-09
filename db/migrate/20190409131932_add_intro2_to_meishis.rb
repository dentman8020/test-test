class AddIntro2ToMeishis < ActiveRecord::Migration[5.2]
  def change
    add_column :meishis, :intro2, :string
  end
end
