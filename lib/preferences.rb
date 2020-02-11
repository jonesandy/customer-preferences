require_relative './calendar.rb'
require_relative './display.rb'

class Preferences

  attr_reader :customers, :calendar

  def initialize(customers, calendar = Calendar.new, display = Display.new)
    @customers = customers
    @calendar = calendar.generate_calendar
    @display = display
  end

  def create_preferences
    assign_customers
    @display.format(@calendar)
    return nil
  end

  private
  
  def assign_customers
    @customers.each do |customer|
      next if customer[:none] == true

      if customer[:everyday] == true
        add_everyday(customer)
      elsif customer[:mday].nil?
        add_specific_days(customer)
      else
        add_specific_date(customer)
      end
    end
  end

  def add_everyday(customer)
    @calendar.each do |date|
      date[:customer].push(customer[:id])
    end
  end

  def add_specific_days(customer)
    @calendar.each do |date|
      if customer[:day].include?(date[:day])
        date[:customer].push(customer[:id])
      end
    end
  end

  def add_specific_date(customer)
    @calendar.each do |date|
      if date[:mday] == customer[:mday]
        date[:customer].push(customer[:id])
      end
    end
  end

end
