require 'spec_helper'

module ::Cio::Utility::Log
  describe Observer do
    describe '#new' do

      let(:task){ 'task' }
      let(:cli){ ::Cio::Cli.new }
      let(:api){ ::Cio::Api.new(cli, task) }

      context 'when given an instance of Cio::Cli' do

        subject{ Observer.new(cli, api, task) }

        its(:task){ should == task }
        its(:cli){ should be_an_instance_of ::Cio::Cli }
        its(:api){ should be_an_instance_of ::Cio::Api }
      end

      context 'when given an instance of Cio::Api' do

        subject{ Observer.new(cli, api, task) }

        its(:task){ should == task }
        its(:cli){ should be_an_instance_of ::Cio::Cli }
        its(:api){ should be_an_instance_of ::Cio::Api }
      end

      describe 'log classes add themselves as observers of the observable' do
        it 'it adds self as observer' do
          mock(api).add_observer(is_a(Observer))
          mock(cli).add_observer(is_a(Observer))
          Observer.new(cli, api, task)
        end
      end

    end
  end
end
