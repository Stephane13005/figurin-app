class ChangeValueToProfiles < ActiveRecord::Migration[6.0]
  def change
  	change_column :profiles, :username, :string, :default => "Anonymous User"
  end
end
