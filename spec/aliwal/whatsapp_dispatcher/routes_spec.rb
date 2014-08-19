require 'spec_helper'

require 'aliwal/whatsapp_dispatcher/routes'

RSpec.describe Aliwal::WhatsappDispatcher::Routes do
  describe '#add_route' do
    it 'adds a new route to routes' do
      expect do
        subject.add_route(Object.new, {})
      end.to change(subject.routes, :count).by(1)
    end
  end
end
