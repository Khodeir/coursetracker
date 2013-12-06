class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.text :name
    end
  end

  def down
    drop_table :students
  end
end
