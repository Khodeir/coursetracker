class Assessment < ActiveRecord::Base
  belongs_to :course
  has_event_calendar
  @@gen = ColorGenerator.new saturation: 0.3, lightness: 0.75, seed: 12345
  def color
    
  	@color = @color.nil? ? '#'+@@gen.create_hex : @color
  end
  def self.assignments
  	Assessment.find_all_by_type('Assignment')
  end
  def self.exams
  	Assessment.find_all_by_type('Exam')
  end
end
