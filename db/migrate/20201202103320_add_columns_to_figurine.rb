class AddColumnsToFigurine < ActiveRecord::Migration[6.0]
  def change
    add_column :figurines, :media_title, :string
    add_column :figurines, :media_year, :integer
    add_column :figurines, :media_universe, :string
  end
end
