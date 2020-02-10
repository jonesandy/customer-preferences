require 'preferences'

describe Preferences do 
  let(:customers) { { a: 2, b: 'TUES', c: 'EVERY DAY', d: 0 } }
  subject(:prefs) { described_class.new(:customers) }

  it 'should save input of hashes' do
    expect(prefs.customers).to eq(:customers)
  end

end
