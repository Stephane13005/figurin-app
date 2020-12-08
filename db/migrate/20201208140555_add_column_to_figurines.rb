class AddColumnToFigurines < ActiveRecord::Migration[6.0]
  def change
    add_column :figurines, :likes_count, :integer
  end
end
