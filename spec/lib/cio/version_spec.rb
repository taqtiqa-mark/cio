require 'spec_helper'

describe Cio do
  describe '.version' do
    it 'returns the current version number' do
      ::Cio.version.should match '0.0.1.pre'
    end
  end
end
