require 'spec_helper'

describe WaffleAPI::Balances do
  subject { WaffleAPI::Balances.new }

  it 'should have expected attributes' do
    subject.should respond_to :sent
    subject.should respond_to :confirmed
    subject.should respond_to :unconverted
    subject.should respond_to :expected
  end

  describe 'after initialization' do
    subject { WaffleAPI::Balances.new confirmed: 1.0, unconverted: 2.0 }

    it 'should correctly set expected' do
      subject.expected.should == 3.0
    end
  end
end
