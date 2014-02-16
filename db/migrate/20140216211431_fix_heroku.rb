class FixHeroku < ActiveRecord::Migration
  def change
    remove_column :Beers, :style, :string
    add_column :Beers, :style_id, :integer
  end
end
