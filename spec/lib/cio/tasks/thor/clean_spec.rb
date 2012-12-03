require 'spec_helper'

module ::Cio
  describe Cli do
    describe '#clean' do

      let(:api){an_instance_of(::Cio::Api)}

      context 'When the default options are used' do

        let(:start){::Cio::Cli.start(['clean'])}
        let(:thor_hash){ ::Thor::CoreExt::HashWithIndifferentAccess }

        it{ start.should be_an_instance_of ::Cio::Api }

        describe 'the API' do
          it 'is initalized with the Cio::Cli and install task' do
            mock.proxy(::Cio::Api).new(is_a(::Cio::Cli), :clean)
            start.cli.should be_a(::Cio::Cli)
          end
          it 'is the Cio::Api' do
            mock.proxy(::Cio::Api).new(is_a(::Cio::Cli), :clean)
            start.should be_a(::Cio::Api)
          end
        end

        it{ any_instance_of(::Cio::Api){|a| proxy(a).config(is_a(thor_hash)){|a| a.should be_a(::Cio::Api)}}; start }
        it{ any_instance_of(::Cio::Api){|a| proxy(a).clean{|a| a.should be_a(::Cio::Api)}}; start }

      end
    end
  end
end
