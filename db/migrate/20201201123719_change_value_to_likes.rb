class ChangeValueToLikes < ActiveRecord::Migration[6.0]
  def change
  	change_column :figurines, :like, :integer, :default => 0
  end
end
