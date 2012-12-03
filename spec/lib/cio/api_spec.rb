require 'spec_helper'

module ::Cio
  describe Api do

    let(:task){ 'task' }
    let(:cli){ ::Cio::Cli.new }
    let(:api){ ::Cio::Api.new(cli, task.intern) }

    describe 'is observable ' do
      subject { api }
      it{ should respond_to :add_observer }
      its(:cli){ should be_a ::Cio::Cli}
      its(:task){ should be_a Symbol}
      its(:logging){ should be_a FalseClass }
      its(:log){ should be_a Array }
    end
  end
end
