require 'spec_helper'

require 'aliwal/whatsapp_dispatcher/route_set'

describe Aliwal::WhatsappDispatcher::RouteSet do
  describe '#draw' do
    it 'calls instance_exec with the block in a Mapper instance' do
      expect_any_instance_of(Aliwal::WhatsappDispatcher::Mapper)
        .to receive(:instance_exec)

      subject.draw { }
    end
  end

  describe '#call' do
    it 'calls the router' do
      expect(subject.router).to receive(:call)

      subject.call({})
    end
  end
end
