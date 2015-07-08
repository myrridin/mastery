class AddSignedUpToOfferings < ActiveRecord::Migration
  def change
    add_column :offerings, :signed_up, :integer
  end
end
