require 'spec_helper'
require 'aliwal/whatsapp_dispatcher/matchers/text'
require 'aliwal/whatsapp_dispatcher/route'

RSpec.describe Aliwal::WhatsappDispatcher::Matchers::Text do
  let(:app) { proc { } }
  let(:env) do
    {
      'whatsapp.input' => request
    }
  end

  let(:route) { Aliwal::WhatsappDispatcher::Route.new(app, regex: regex) }
  let(:regex) { /^my\-prefix (?<text>.*)$/ }
  let(:request) do
    double('request', text?: true, body: double(data: 'my-prefix foo'))
  end

  subject { described_class.new(env, route) }

  describe '#match?' do
    context 'matching the route regex' do
      it 'returns true' do
        expect(subject.match?).to be_eql(true)
      end
    end

    context 'no matching the route regex' do
      let(:regex) { /^my\-prefix (.*)$/ }
      let(:request) do
        double('request', text?: true, body: double(data: 'no-prefix foo'))
      end

      it 'returns false' do
        expect(subject.match?).to be_eql(false)
      end
    end
  end

  describe '#params' do
    context 'with matching data' do
      it 'returns the params' do
        params = subject.params
        expect(params).to be_kind_of(Hash)
        expect(params[:text]).to be_eql('foo')
      end
    end

    context 'with no matching data' do
      let(:request) do
        double('request', text?: true, body: double(data: 'no-prefix foo'))
      end

      it 'returns an empty hash' do
        params = subject.params
        expect(params).to be_eql({})
      end
    end
  end
end
