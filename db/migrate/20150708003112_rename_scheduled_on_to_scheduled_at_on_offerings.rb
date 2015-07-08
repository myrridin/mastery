class RenameScheduledOnToScheduledAtOnOfferings < ActiveRecord::Migration
  def change
    rename_column :offerings, :scheduled_on, :scheduled_at
  end
end
