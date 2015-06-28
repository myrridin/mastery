class RenameScheduledCourseToOffering < ActiveRecord::Migration
  def change
    rename_table :scheduled_courses, :offerings

    rename_column :class_signups, :scheduled_course_id, :offering_id
  end
end
