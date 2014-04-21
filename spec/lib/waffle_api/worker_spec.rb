require 'spec_helper'

describe WaffleAPI::Worker do
  subject { build :worker }

  it 'should have expected attributes' do
    subject.should respond_to :name
    subject.should respond_to :hash_rate
    subject.should respond_to :stale_rate
    subject.should respond_to :last_seen
  end

  it 'should parse last_seen to Time' do
    subject.last_seen.should be_an_instance_of Time
  end
end
