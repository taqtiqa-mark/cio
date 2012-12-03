# NOTE:
#These specs are causing ruby memory consumption to explode.
#They are now described in a cucumber feature.
#
#require 'spec_helper'
#
#module ::Cio::Utility::Log
#  describe Observer do
#    describe '#new' do
#
#      let(:task){ 'version' }
#      let(:cli){ ::Cio::Cli.new }
#      let(:api){ ::Cio::Api.new(cli, task) }
#
#      describe 'When a quiet cli option is given' do
#
#        let(:start){ ::Cio::Cli.start([task, '--quiet']) }
#
#        it 'it adds an observer' do
#          ::Cio::Api.any_instance.should_receive(:add_observer).with(an_instance_of(::Cio::Utility::Log::Observer))
#          ::Cio::Cli.any_instance.should_receive(:add_observer).with(an_instance_of(::Cio::Utility::Log::Observer))
#          start
#        end
#        it 'does say version' do
#          ::Cio::Cli.any_instance.should_receive(:quiet).with('Log level quiet')
#          ::Cio::Cli.any_instance.should_receive(:say).with(::Cio.version)
#          start
#        end
#        it 'does say quiet log information' do
#          pending
#          # TODO: Resolve why this is failing, even though the data is set OK.
#          ::Cio::Cli.any_instance.should_receive(:quiet).with('Log level quiet')
#          start
#        end
#        it 'does not say loud log information' do
#          ::Cio::Cli.any_instance.should_not_receive(:loud).with('Log level loud')
#          start
#        end
#      end
#      describe 'When a loud cli option is given' do
#
#        let(:start){ ::Cio::Cli.start([task, '--loud']) }
#
#        it 'it adds an observer' do
#          ::Cio::Api.any_instance.should_receive(:add_observer).with(an_instance_of(::Cio::Utility::Log::Observer))
#          ::Cio::Cli.any_instance.should_receive(:add_observer).with(an_instance_of(::Cio::Utility::Log::Observer))
#          start
#        end
#        it 'does say version' do
#          str = 'Log level loud/nAbout to say version/nJust said version'
#          ::Cio::Cli.any_instance.should_receive(:loud).with(str)
#          ::Cio::Cli.any_instance.should_receive(:say).with(::Cio.version)
#          start
#        end
#        it 'does say loud log information' do
#          #pending
#          # TODO: Resolve why this is failing, even though the data is set OK.
#          ::Cio::Cli.any_instance.should_receive(:loud).with('Log level loud')
#          start
#        end
#        it 'does not say quiet log information' do
#          ::Cio::Cli.any_instance.should_not_receive(:quiet).with('Log level quiet')
#          start
#        end
#      end
#      describe 'When neither quiet nor loud cli options are given' do
#
#        let(:start){ ::Cio::Cli.start([task]) }
#
#        it 'does not add an observer' do
#          ::Cio::Api.any_instance.should_not_receive(:add_observer)
#          ::Cio::Cli.any_instance.should_not_receive(:add_observer)
#          start
#        end
#        it 'does not say log information' do
#          ::Cio::Cli.any_instance.should_not_receive(:quiet).with('Log level quiet')
#          ::Cio::Cli.any_instance.should_not_receive(:loud).with('Log level loud')
#          start
#        end
#      end
#    end
#  end
#end
