class CreateCourses < ActiveRecord::Migration
  def up
    create_table :courses do |t|
      t.string 'title'
      t.text 'name'
      t.datetime 'startDate'
      t.datetime 'endDate'
      t.string 'webpage'
      t.integer 'student_id'
      t.timestamps 
    end
  end

  def down
    drop_table :courses
  end
end
