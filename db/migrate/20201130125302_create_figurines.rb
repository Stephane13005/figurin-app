class CreateFigurines < ActiveRecord::Migration[6.0]
  def change
    create_table :figurines do |t|
      t.string :name
      t.integer :year
      t.string :brand
      t.text :description
      t.integer :like
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
