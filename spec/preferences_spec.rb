require 'preferences'

describe Preferences do 
  let(:customers) { 
    [
    { id: 'A', mday: 12, day: nil, everyday: false, none: false },
    { id: 'B', mday: nil, day: ['TUE'], everyday: false, none: false },
    { id: 'C', mday: nil, day: ['MON', 'FRI'], everyday: false, none: false },
    { id: 'D', mday: nil, day: nil, everyday: true, none: false },
    { id: 'E', mday: nil, day: nil, everyday: false, none: true }
    ] 
  }

  subject(:prefs) { described_class.new(:customers) }

  it 'should save input of hashes' do
    expect(prefs.customers).to eq(:customers)
  end

end
