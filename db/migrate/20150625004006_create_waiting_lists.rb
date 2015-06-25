class CreateWaitingLists < ActiveRecord::Migration
  def change
    create_table :waiting_lists do |t|
      t.references :user
      t.references :course
      t.integer :position

      t.timestamps null: false
    end
  end
end
