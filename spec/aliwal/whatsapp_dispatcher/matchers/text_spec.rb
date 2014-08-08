require 'spec_helper'
require 'aliwal/whatsapp_dispatcher/matchers/text'
require 'aliwal/whatsapp_dispatcher/route'

describe Aliwal::WhatsappDispatcher::Matchers::Text do
  let(:app) { proc { } }
  let(:env) do
    {
      'request' => request
    }
  end

  subject { described_class.new(env, route) }

  describe '#match?' do
    let(:route) { Aliwal::WhatsappDispatcher::Route.new(app, regex: regex) }

    context 'matching the route regex' do
      let(:regex) { /^my\-prefix (.*)$/ }
      let(:request) do
        double('request', body: 'my-prefix foo')
      end

      it 'returns true' do
        expect(subject.match?).to be_eql(true)
      end
    end

    context 'no matching the route regex' do
      let(:regex) { /^my\-prefix (.*)$/ }
      let(:request) do
        double('request', body: 'no-prefix foo')
      end

      it 'returns false' do
        expect(subject.match?).to be_eql(false)
      end
    end
  end
end
