require 'spec_helper'

describe WaffleAPI::Client do
  describe 'without address' do
    it 'raises WaffleAPI::Error::EmptyAddress' do
      expect do
        WaffleAPI::Client.new
      end.to raise_error(WaffleAPI::Error::EmptyAddress)
    end
  end

  describe 'with a bad address' do
    it 'raises WaffleAPI::Error::BadAddress' do
      expect do
        WaffleAPI::Client.new address: 'some_bad_address'
      end.to raise_error(WaffleAPI::Error::BadAddress)
    end
  end

  describe 'If wafflepool has moved his api endpoint' do
    subject do
      stub_waffle_with Wafflepool::EndPointMoved
      WaffleAPI::Client.new address: BTC_ADDRESS
    end

    it 'raises WaffleAPI::Error::EndPointMoved' do
      expect do
        subject.hashrate
      end.to raise_error(WaffleAPI::Error::EndPointMoved)
    end
  end

  describe 'with address which not exist on waffle' do
    subject do
      stub_waffle_with Wafflepool::AddressNotFound
      WaffleAPI::Client.new address: BTC_ADDRESS
    end

    it 'raises WaffleAPI::Error::AddressNotFound' do
      expect do
        subject.hashrate
      end.to raise_error(WaffleAPI::Error::AddressNotFound)
    end
  end

  describe 'with a not yet supported error' do
    subject do
      stub_waffle_with Wafflepool::UnknownError
      WaffleAPI::Client.new address: BTC_ADDRESS
    end

    it 'raises WaffleAPI::Error::UnknownError' do
      expect do
        subject.hashrate
      end.to raise_error(WaffleAPI::Error::UnknownError)
    end
  end

  describe 'with a valid address' do
    subject do
      stub_waffle_with Wafflepool::Success
      WaffleAPI::Client.new address: BTC_ADDRESS
    end

    describe 'asking for a non existing key' do
      it 'raises NoMethodError' do
        expect do
          subject.i_hope_this_key_will_never_exist
        end.to raise_error(NoMethodError)
      end
    end

    describe 'hashrate' do
      it 'returns correct hashrate' do
        subject.hash_rate.should == 4_303_407
      end

      it 'returns correct hashrate' do
        subject.hash_rate.should == 4_303_407
      end
    end

    describe 'workers' do
      it 'returns an array of WaffleAPI::Worker' do
        subject.workers.each do |worker|
          worker.should be_an_instance_of WaffleAPI::Worker
        end
      end
    end

    describe 'balances' do
      it 'returns an instance of WaffleAPI::Balnaces' do
        subject.balances.should be_an_instance_of WaffleAPI::Balances
      end
    end

    describe 'payments' do
      it 'returns an array of WaffleAPI::Payment' do
        subject.payments.each do |payment|
          payment.should be_an_instance_of WaffleAPI::Payment
        end
      end
    end
  end
end
