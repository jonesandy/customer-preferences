require 'date'

class Calendar
   
  DAYS = 90

  attr_reader :days

  def initialize(days = DAYS)
    @days = days
    @today = Date.new
    @calendar = []
  end

  def generate_calendar
    
  end
end
 