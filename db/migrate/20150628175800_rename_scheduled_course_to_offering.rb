class RenameScheduledCourseToOffering < ActiveRecord::Migration
  def change
    rename_table :scheduled_courses, :offerings
  end
end
