require_relative './calendar.rb'

class Preferences

  attr_reader :customers, :calendar

  def initialize(customers, calendar = Calendar.new)
    @customers = customers
    @calendar = calendar.generate_calendar
  end

  def create_prefs
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

  private

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
