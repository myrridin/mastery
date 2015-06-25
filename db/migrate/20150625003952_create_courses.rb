class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :section
      t.integer :number
      t.string :name
      t.text :description
      t.integer :length
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
