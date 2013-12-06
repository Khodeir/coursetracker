class AddColorIdToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :color_id, :integer, default: 1
  end
end
