class SetDefaultToZeroForOfferingSignedUp < ActiveRecord::Migration
  def change
    change_column :offerings, :signed_up, :integer, :null => false
  end
end
