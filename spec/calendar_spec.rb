require 'calendar'
require 'date'
require 'timecop'

describe Calendar do

  subject(:calendar) { described_class.new }

  describe '#initialize' do

    it 'should start with 90 days' do
      expect(calendar.days).to eq(90)
    end

    it 'should start with 40 days' do
      cal = Calendar.new(40)
      expect(cal.days).to eq(40)
    end

  end

  describe '#generate_calendar' do
    before do
      Timecop.freeze(Date.today)
    end

    after do
      Timecop.return
    end

  end

end
