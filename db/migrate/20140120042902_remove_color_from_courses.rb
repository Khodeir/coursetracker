class RemoveColorFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :color
  end
end
