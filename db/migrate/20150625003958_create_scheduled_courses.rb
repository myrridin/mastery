class CreateScheduledCourses < ActiveRecord::Migration
  def change
    create_table :scheduled_courses do |t|
      t.references :course
      t.integer :size
      t.datetime :scheduled_on
      t.string :location
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
