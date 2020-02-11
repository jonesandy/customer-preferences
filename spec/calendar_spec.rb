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
      Timecop.freeze(2020, 02, 01)
    end

    after do
      Timecop.return
    end

    it 'should generate an array' do
      expect(calendar.generate_calendar).to be_an_instance_of(Array)
    end
    
    it 'should generate array DAYS in length' do
      expect(calendar.generate_calendar.length).to eq(Calendar::DAYS)
    end

    it 'should generate array with dates in hashes' do
      date = { date: '2020', month: 'February', mday: 1, day: 'SAT', customer: [] }
      expect(calendar.generate_calendar).to include(date)
    end

  end

end
