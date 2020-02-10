require_relative './calendar.rb'

class Preferences

  attr_reader :customers, :calendar

  def initialize(customers, calendar = Calendar.new)
    @customers = customers
    @calendar = calendar.generate_calendar
  end

  

end
