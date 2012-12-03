require 'spec_helper'

module ::Cio
  describe Cli do
    subject { ::Cio::Cli.start }
    it{ should be_nil }
  end
end