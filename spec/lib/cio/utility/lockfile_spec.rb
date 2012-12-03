require 'spec_helper'

module ::Cio::Utility
  describe Lockfile do

    context 'public/private instance methods' do
      subject{ Class.new { extend(::Cio::Utility::Lockfile) } }
      it{ should respond_to :lockfile, :overwrite }
      it{ should_not respond_to :contents }
    end

    describe '#lockfile', :fakefs do
      ::DummyKlass = Class.new do
        include ::Cio::Utility::Lockfile
      end
      subject{ ::DummyKlass.new.lockfile }
      let(:start){ ::Cio::Cli.start(['install']) }
      let(:source){ complete_ciofile }
      let(:tmp_dir){ FileUtils.mkdir_p('/tmp/xyz')[0] }

      it{ should be_a ::DummyKlass }

      context 'output location' do
        it 'is the same as the Ciofile' do
          File.open("#{tmp_dir}/Ciofile", 'w') {|f| f.write(source) }
          Dir.chdir(tmp_dir) do
            start
            File.exists?(::Cio.file).should be_true
            File.exists?(::Cio.lockfile).should be_true
            File::dirname(::Cio.file) == File::dirname(::Cio.lockfile)
          end
        end
      end

      context 'generated output' do
        it 'overwrites an existing lockfile' do
          File.open("#{tmp_dir}/Ciofile.lock", 'w') {|f| f.write('You will not see this') }
          Dir.chdir(tmp_dir) do
            start
            File.read("#{tmp_dir}/Ciofile.lock").should_not match 'You will not see this'
          end
        end
      end
    end
  end
end