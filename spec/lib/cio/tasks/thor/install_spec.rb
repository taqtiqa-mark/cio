require 'spec_helper'

module ::Cio
  describe Cli do
    describe '#install' do

      let(:cli){ ::Cio::Cli.new }
      let(:api){is_a(::Cio::Api)}

      context 'a complete ciofile' do
        context 'when the default options are used' do

          let(:start){ ::Cio::Cli.start(['install']) }

          it{ start.should be_an_instance_of ::Cio::Api }

          describe 'the API' do
            it 'is initalized with the Cio::Cli and install task' do
              mock.proxy(::Cio::Api).new(is_a(::Cio::Cli), :install)
              start.cli.should be_a(::Cio::Cli)
            end
            it 'is the Cio::Api' do
              mock.proxy(::Cio::Api).new(is_a(::Cio::Cli), :install)
              start.should be_a(::Cio::Api)
            end

            it{  any_instance_of(::Cio::Api){|a| dont_allow(a).clean} ; start }
            it_behaves_like 'the verify task API sequence'
            it{ any_instance_of(::Cio::Api){|a| proxy(a).install{|a| a.should be_a(::Cio::Api)}} ; start }

          end
        end

        context 'When the clean option is used' do

          let(:start){ ::Cio::Cli.start(['install', '--clean']) }

          it{ start.should be_an_instance_of ::Cio::Api }

          describe 'the API' do
            it 'is initalized with the Cio::Cli and install task' do
              mock.proxy(::Cio::Api).new(is_a(::Cio::Cli), :install)
              start
            end
            it 'is the Cio::API' do
              start.should be_a(::Cio::Api)
            end

            it{ any_instance_of(::Cio::Api){|a| proxy(a).clean{|a| a.should be_a(::Cio::Api)}}; start }
            it_behaves_like 'the verify task API sequence'
            it{ any_instance_of(::Cio::Api){|a| proxy(a).install{|a| a.should be_a(::Cio::Api)}} ; start }

          end
        end
      end

      context 'An incomplete ciofile' do

      end

    end
  end
end