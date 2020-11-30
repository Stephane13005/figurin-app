class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :figurine, null: false, foreign_key: true

      t.timestamps
    end
  end
end