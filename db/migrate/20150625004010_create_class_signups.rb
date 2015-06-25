class CreateClassSignups < ActiveRecord::Migration
  def change
    create_table :class_signups do |t|
      t.references :user
      t.references :scheduled_course
      t.datetime :signed_up_on
      t.boolean :attended

      t.timestamps null: false
    end
  end
end
