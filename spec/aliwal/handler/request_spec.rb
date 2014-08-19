require 'spec_helper'
require 'aliwal/handler/request'

RSpec.describe Aliwal::Handler::Request do
  let(:env) do
    { 'dispatcher.params' => { 'foo' => 'bar' } }
  end

  subject { described_class.new(env) }

  describe '#params' do
    it 'returns the correct params' do
      expect(subject.params).to be_eql('foo' => 'bar')
    end
  end
end
