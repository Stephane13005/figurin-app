class AddPriceToFigurines < ActiveRecord::Migration[6.0]
  def change
  	add_monetize :figurines, :price, currency: { present: false }
  end
end
