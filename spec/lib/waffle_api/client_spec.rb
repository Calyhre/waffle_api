require 'spec_helper'

describe WaffleAPI::Client do
  describe 'without address' do
    it 'raises an WaffleAPI::Error::EmptyAddress' do
      expect do
        WaffleAPI::Client.new
      end.to raise_error(WaffleAPI::Error::EmptyAddress)
    end
  end

  describe 'with a bad address' do
    it 'raises an WaffleAPI::Error::BadAddress' do
      expect do
        WaffleAPI::Client.new address: 'some_bad_address'
      end.to raise_error(WaffleAPI::Error::BadAddress)
    end
  end

  describe 'with a valid address' do
    subject do
      WaffleAPI::Client.new address: BTC_ADDRESS
    end

    describe 'asking for a non existing key' do
      it 'raises an NoMethodError' do
        stub_waffle Wafflepool::Success

        expect do
          subject.i_hope_this_key_will_never_exist
        end.to raise_error(NoMethodError)
      end
    end

    describe 'asking for an existing key' do
      it 'just return it' do
        stub_waffle Wafflepool::Success

        expect(subject.hashrate).to eq 4_303_407
      end
    end
  end
end
