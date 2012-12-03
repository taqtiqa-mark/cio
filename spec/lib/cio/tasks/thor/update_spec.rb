require 'spec_helper'

module ::Cio
  describe Cli do
    describe '#update' do

      let(:api){an_instance_of(::Cio::Api)}

      context 'a complete ciofile' do
        context 'when the default options are used' do

          let(:start){ ::Cio::Cli.start(['update']) }

          it{ start.should be_an_instance_of ::Cio::Api }

          describe 'the API' do
            it 'is initalized with the Cio::Cli and install task' do
              mock.proxy(::Cio::Api).new(is_a(::Cio::Cli), :update)
              start.cli.should be_a(::Cio::Cli)
            end
            it 'is the Cio::Api' do
              mock.proxy(::Cio::Api).new(is_a(::Cio::Cli), :update)
              start.should be_a(::Cio::Api)
            end

            it{  any_instance_of(::Cio::Api){|a| dont_allow(a).clean} ; start }
            it_behaves_like 'the verify task API sequence'
            it{ any_instance_of(::Cio::Api){|a| proxy(a).update{|a| a.should be_a(::Cio::Api)}} ; start }

          end
        end
      end
    end
  end
end
