require 'spec_helper'

describe WaffleAPI::Balances do
  subject { build :balances }

  it 'should have expected attributes' do
    subject.should respond_to :sent
    subject.should respond_to :confirmed
    subject.should respond_to :unconverted
    subject.should respond_to :expected
  end

  it 'should correctly set expected' do
    subject.expected.should == subject.confirmed + subject.unconverted
  end
end
