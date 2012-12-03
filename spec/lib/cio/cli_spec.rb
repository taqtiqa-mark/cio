require 'spec_helper'

module ::Cio
  describe Cli do
    subject { ::Cio::Cli.start }
    it{ should be_nil }
    describe '.source_root' do
      subject { ::Cio::Cli.source_root }
      it{ should be_an_instance_of String }
      it{ should match /\/lib\/cio$/ }
    end
  end
end
