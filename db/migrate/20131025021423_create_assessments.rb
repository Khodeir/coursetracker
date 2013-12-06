class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :name
      t.integer :weight
      t.datetime :start_at
      t.datetime :end_at
      t.string :type
      t.belongs_to :course
      t.timestamps
    end
  end
end
