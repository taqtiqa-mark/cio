require 'spec_helper'

module ::Cio
  describe Cli do
    describe '#resolve' do

      let(:api){an_instance_of(::Cio::Api)}

      context 'a complete ciofile' do
        context 'when the default options are used' do

          let(:start){ ::Cio::Cli.start(['resolve']) }
          let(:thor_hash){ an_instance_of(Thor::CoreExt::HashWithIndifferentAccess) }
          let(:api){ an_instance_of(::Cio::Api) }

          it{ start.should be_an_instance_of ::Cio::Api }

          describe 'the API' do
            it 'is initalized with the Cio::Cli and install task' do
              mock.proxy(::Cio::Api).new(is_a(::Cio::Cli), :resolve)
              start.cli.should be_a(::Cio::Cli)
            end
            it 'is the Cio::Api' do
              mock.proxy(::Cio::Api).new(is_a(::Cio::Cli), :resolve)
              start.should be_a(::Cio::Api)
            end

            it{  any_instance_of(::Cio::Api){|a| dont_allow(a).clean} ; start }
            it_behaves_like 'the resolve task API sequence'

          end
        end
      end
    end
  end
end
