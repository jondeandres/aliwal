require 'spec_helper'

require 'aliwal/whatsapp_dispatcher/mapping'

describe Aliwal::WhatsappDispatcher::Mapping do
  subject { described_class.new(options)}

  describe '#to_route' do
    context 'when :to option is a String' do
      let(:options) { { to: 'echos#test' } }

      it 'returns a Dispatcher instance and the options' do
        app, opts = subject.to_route

        expect(app).to be_kind_of(Aliwal::WhatsappDispatcher::Dispatcher)
        expect(opts).to be_eql(options)
      end
    end

    context 'if the :to option is callable' do
      context 'returns the callable object and the options' do
        let(:options) { { to: proc {} } }

        it 'returns the proc object and the options' do
          app, opts = subject.to_route

          expect(app).to be_eql(options[:to])
          expect(opts).to be_eql(options)
        end
      end
    end
  end
end
