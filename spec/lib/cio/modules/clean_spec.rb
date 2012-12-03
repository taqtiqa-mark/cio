# NOTE:
#One specs is failing likely because of the
#dynamic def of say in Cio::Modules::Configuration#config.
#They are also described in a cucumber feature.
#
require 'spec_helper'

module ::Cio
  describe Api do

    describe '#clean' do
      let(:api_step){'clean'}
      let(:task){ 'clean' }
      let(:cli){ ::Cio::Cli.new }
      let(:api){ ::Cio::Api.new(cli, task) }

      context 'default options' do

        let(:start){::Cio::Cli.start([task])}

        it 'does not change state' do
          any_instance_of(::Cio::Api){|a| dont_allow(a).changed}
          start.should_not have_received.changed
        end
        it{ dont_allow(::Cio::Api).changed; start.should_not have_received.changed }
        it 'says the version number' do
          dont_allow(::Cio::Cli).quiet('Log level quiet')
          dont_allow(::Cio::Cli).quiet('Log level loud')
          start
        end
      end

      context 'quiet option' do

        let(:start){::Cio::Cli.start([task, '--quiet'])}
        it 'logs at the quiet level' do
          @checklog = []
          any_instance_of(::Cio::Api) do |a|
            mock.proxy(a).cli.times(any_times) do |cli_self|
              @checklog = cli_self.log
              cli_self
            end
          end
          #original_new = ::Cio::Api.method(:new)
          #::Cio::Api.should_receive(:new).once do |arg|
          #  arg.should be_an_instance_of(::Cio::Cli)
          #  arg.should_receive(:say).with(::Cio.version).and_return(be_an_instance_of(String))
          #  original_new.call(arg)
          #end
          start
          @checklog.should eq(['---','Log level quiet', "Start task api: #{api_step}", "End task api: #{api_step}"])
        end
      end

      # Shared examples are currently problematic
      #it_should_behave_like "a loud logger", task, expected_log

      context 'loud option' do

        let(:start){::Cio::Cli.start([task, '--loud'])}

        it 'logs at the loud level' do
          @checklog = []
          any_instance_of(Cio::Api) do |a|
            mock.proxy(a).cli.times(any_times) do |cli_self|
              @checklog = cli_self.log
              cli_self
            end
          end
          start
          @checklog.should include('---','Log level loud', "Start task api: #{api_step}", "End task api: #{api_step}")
        end
        context 'raise option' do

          let(:start){::Cio::Cli.start([task, '--loud','--raise', 'qwerty'])}

          it 'logs message given to raise' do
            @checklog = []
            any_instance_of(Cio::Api) do |a|
              mock.proxy(a).cli.times(any_times) do |cli_self|
                @checklog = cli_self.log
                cli_self
              end
            end
            start
            expected_log = ['---','Log level loud', 'Cio caught exception qwerty','Log level loud']
            expected_log.each do |elem|
              @checklog.should include(elem)
            end
          end
        end
      end
    end
  end
end
