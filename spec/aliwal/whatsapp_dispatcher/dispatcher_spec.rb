require 'spec_helper'
require 'aliwal/whatsapp_dispatcher/dispatcher'

RSpec.describe Aliwal::WhatsappDispatcher::Dispatcher do
  let(:defaults) do
    { handler: 'mock', action: 'mock' }
  end

  let(:matcher) do
    double(params: { foo: 'bar' })
  end

  let(:env) { { 'router.matcher' => matcher } }

  subject { described_class.new(defaults) }

  let(:expected_env) do
    env
      .merge('dispatcher.params' => defaults.merge(matcher.params))
  end

  describe '#call' do
    it 'returns the correct params' do
      expect(MockHandler).to receive(:call).with(expected_env)
      subject.call(env)
    end
  end
end
