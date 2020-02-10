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
    count = 0

    while count < DAYS do
      @calendar.push(count)
      count += 1
    end

    return @calendar
  end

end
 