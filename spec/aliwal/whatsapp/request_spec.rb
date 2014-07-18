require 'spec_helper'
require 'aliwal/whatsapp/request'


describe Aliwal::Whatsapp::Request do
  let(:fixture) { request_fixture('body_and_notify') }

  subject { described_class.create(fixture) }

  describe '#tag' do
    it { expect(subject.tag).to be_eql('message') }
  end

  describe '#type' do
    it { expect(subject.type).to be_eql('chat') }
  end

  describe '#from' do
    it { expect(subject.from).to be_eql('34635730544@s.whatsapp.net') }
  end

  describe '#id' do
    it { expect(subject.id).to be_eql('1405689098-32') }
  end

  describe '#timestamp' do
    it { expect(subject.timestamp).to be_eql('1405695101') }
  end

  describe '#timestamp' do
    it { expect(subject.timestamp).to be_eql('1405695101') }
  end

  describe "#nodes" do
    it 'is a hash' do
      expect(subject.nodes).to be_kind_of(Hash)
    end
  end

  describe '#body' do
    it 'is a Request object' do
      expect(subject.body).to be_kind_of(described_class)
    end
  end

  describe "#data" do
    context 'for a parent request node' do
      it 'returns nil' do
        expect(subject.data).to be_nil
      end
    end

    context 'for a body node' do
      it 'returns the message content' do
        expect(subject.body.data).to be_eql('foo')
      end
    end
  end

  describe '#xmlns' do
    context 'for a notify node' do
      it 'returns correct xmlns value' do
        expect(subject.notify.xmlns).to be_eql('urn:xmpp:whatsapp')
      end
    end

    context 'for a request node' do
      it 'returns correct xmlns value' do
        expect(subject.request.xmlns).to be_eql('urn:xmpp:receipts')
      end
    end
  end
end
