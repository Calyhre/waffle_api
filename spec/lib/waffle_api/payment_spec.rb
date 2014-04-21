require 'spec_helper'

describe WaffleAPI::Payment do
  subject { build :payment }

  it 'should have expected attributes' do
    subject.should respond_to :amount
    subject.should respond_to :paid_at
    subject.should respond_to :transaction_hash
  end

  it 'should parse paid_at to Time' do
    subject.paid_at.should be_an_instance_of Time
  end
end
