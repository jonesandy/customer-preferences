require 'date'

class Calendar
   
  DAYS = 90

  attr_reader :days

  def initialize(days = DAYS)
    @days = days
    @today = Date.today
    @calendar = []
  end

  def generate_calendar
    @calendar = [{}, {}]
  end

end
 