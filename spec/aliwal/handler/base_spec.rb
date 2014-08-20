require 'spec_helper'
require 'aliwal/handler/base'


RSpec.describe Aliwal::Handler::Base do
  let(:env) do
    {
      'dispatcher.params' => {
        handler: 'mock',
        action: 'mock'
      }
    }
  end

  describe '.call' do
    it 'calls mock in an instance' do
      expect_any_instance_of(described_class).to receive('mock')
      described_class.call(env)
    end
  end
end
