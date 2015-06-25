class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.boolean :instructor_flag
      t.string :admin_flag
      t.string :boolean

      t.timestamps null: false
    end
  end
end
