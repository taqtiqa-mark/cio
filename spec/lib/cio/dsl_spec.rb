require 'spec_helper'

module ::Cio
  describe Dsl do

    class Dsl
      attr_accessor :bdd
      def bdd_run(spec, feature='world')
        # Note that api.task refers to the api in Dsl.new(new)
        @bdd = "Task (from api arg): #{api.task} DSL arg #1: #{spec} DSL arg #2: #{feature}"
        self
      end
    end

    let(:task){ 'resolve' } # no disk writes nor inet access
    let(:cli){ ::Cio::Cli.new }
    let(:api){ ::Cio::Api.new(cli, task) }

    describe 'vocabulary' do
      subject(:dsl) { ::Cio::Dsl.new(api){bdd_run('block', 'execution') }.execute }

      it{ should be_a ::Cio::Dsl }
      its(:api){ should be_a ::Cio::Api }
      its(:cli){ should be_a ::Cio::Cli }
      its(:script){ should be_a Proc }
      it{ should respond_to :site}
      it{ should respond_to :cookbook}
      it{ should respond_to :parse}
      it 'should not respond to Cio::Api methods' do
        should_not respond_to :config
      end
      it 'should not respond to Cio::Cli methods' do
        should_not respond_to :options
      end
    end

    describe 'block execution' do
      def bdd_run(spec, feature='world')
        'ouch'
      end
      it 'runs blocks in context Cio::Dsl.new(api) given to init/new' do
        result = ::Cio::Dsl.new(api){ bdd_run('block', 'execution') }.execute
        result.bdd.should == 'Task (from api arg): resolve DSL arg #1: block DSL arg #2: execution'
      end
      it 'runs blocks later in Cio::Dsl.new(api) context' do
        result = ::Cio::Dsl.new(api){ bdd_run('block', 'execution') }
        result.bdd.should be_nil
        result.go!
        result.bdd.should == 'Task (from api arg): resolve DSL arg #1: block DSL arg #2: execution'
      end
      it 'runs blocks in Cio::Dsl.new(api) context to init/new' do
        result = ::Cio::Dsl.new(api){ bdd_run('block', 'execution') }.go!
        result.bdd.should == 'Task (from api arg): resolve DSL arg #1: block DSL arg #2: execution'
      end
    end
    describe 'initialization argument' do
      it 'accepts only ::Cio::Api instances' do
        expect {::Cio::Dsl.new('api'){ bdd_run('block', 'execution') }.execute }.to raise_error(ArgumentError, 'Expected an instance of Cio::Api. Received String')
      end
    end

    describe '#parse(api, file)', :fakefs do
      let(:config){::Cio::Cli.start(['version'])}

      before(:all) do
        config
        ::File.open( ::Cio.file, 'w') {|f| f.write(ciofile_spec) }
      end

      subject(:parsed_dsl){ ::Cio::Dsl.new(api).parse(::Cio.file) }
      it 'executes a dsl file in the context of a ::Cio::Dsl instance' do
        parsed_dsl.should be_a ::Cio::Dsl
      end
      it 'places the evaluated Ciofile in a Hash' do
        ::Cio.manifest.should be_a Hash
        ::Cio.manifest.should have(2).items
      end
      context 'sites' do
        it 'should append all sites to an array' do
          ::Cio.manifest[:sites].should have(3).items
        end
      end
      context 'cookbooks' do
        it 'should append all cookbooks to an array' do
          ::Cio.manifest[:cookbooks].should have(13).items
        end
        context 'cookbook' do
          subject(:cookbook){ ::Cio.manifest[:cookbooks].last }
          context 'parameters' do
            it 'accepts name' do
              cookbook[:name].should == 'oc-timezone'
            end
            it 'accepts version constraint' do
              cookbook[:version].should == '0.0.1'
            end
            it 'accepts archive md5 constraint' do
              cookbook[:md5].should == 'asjhdjhf70kj4328'
            end
          end
          context 'options' do
            it 'accepts a site assigned by variable' do
              cookbook[:site].should == 'http://www.mine.com'
            end
            it 'accepts the archive md5 checksum' do
              cookbook[:md5].should == 'asjhdjhf70kj4328'
            end
            it 'accepts the cookbook depends name' do
              cookbook[:depends_name].should == 'timezone'
            end
          end
        end
      end
    end
  end
end
