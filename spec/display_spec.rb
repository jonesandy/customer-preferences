require 'display'

describe Display do

  subject(:display) { described_class.new }

  describe '#format' do

    let(:input) { [
    { :date => "2020", :month => 'February', :mday => 11, :day => "TUE", :customer => ["B", "D"] },
    { :date => "2020", :month => 'February', :mday => 12, :day => "WED", :customer => ["A", "D"] },
    { :date => "2020", :month => 'February', :mday => 13, :day => "THU", :customer => ["D"] },
    { :date => "2020", :month => 'February', :mday => 14, :day => "FRI", :customer => ["C", "D"] }
    ] 
    }

    it 'should return a certain format' do
      expect { display.format(input) }.to output("TUE 11 February 2020 - B, D\nWED 12 February 2020 - A, D\nTHU 13 February 2020 - D\nFRI 14 February 2020 - C, D\n").to_stdout
    end

  end

end
