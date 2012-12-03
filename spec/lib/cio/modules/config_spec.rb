require 'spec_helper'

module ::Cio::Modules
  describe '#config', :fakefs do
    let(:task){ 'verify' } # configures, but does not touch file system
    let(:api_step){'config'}
    let(:source){"#{tmp_dir}/Ciofile"}
    let(:tmp_dir){'/tmp/xyz'}
    let(:tmp_dir_a){'/tmp/abc'}
    let(:create_ciofile){File.open(source, 'w') {|f| f.write(complete_ciofile) }}
    let(:create_ciofile2){File.open(source2, 'w') {|f| f.write(complete_ciofile) }}
    let(:cookbooks){"#{tmp_dir}/cookbooks"}
    let(:dir_a_regex){Regexp.new(tmp_dir_a)}
    let(:dir_regex){Regexp.new(tmp_dir)}

    context 'tasks (default)' do

      let(:start){::Cio::Cli.start([task])}
      let(:lockfile){"#{tmp_dir}/Ciofile.lock"}

      it 'sets default files location to working directory' do
        FileUtils.mkdir_p(tmp_dir)
        create_ciofile
        Dir.chdir(tmp_dir) do
          start
          ::Cio.file.should == source
          ::Cio.lockfile.should == lockfile
          ::Cio.cookbooks.should == cookbooks

          ::Cio.cookbooks.should match dir_regex
          ::Cio.file.should match dir_regex
          ::Cio.lockfile.should match dir_regex
        end
      end
    end

    context 'tasks passed source option with path' do
      let(:source2){"#{tmp_dir_a}/Ciofile2"}
      let(:lockfile2){"#{tmp_dir_a}/Ciofile2.lock"}
      let(:cookbooks2){"#{tmp_dir_a}/cookbooks"}
      let(:start){::Cio::Cli.start([task, '--source', source2])}

      it 'sets default files location to given directory' do
        FileUtils.mkdir_p(tmp_dir)
        FileUtils.mkdir_p(tmp_dir_a)
        create_ciofile2
        Dir.chdir(tmp_dir) do
          start
          ::Cio.file.should == source2
          ::Cio.lockfile.should == lockfile2
          ::Cio.cookbooks.should == cookbooks

          ::Cio.file.should match dir_a_regex
          ::Cio.lockfile.should match dir_a_regex
          ::Cio.cookbooks.should match dir_regex
        end
      end
    end

    context 'tasks passed source option with file only' do
      let(:source2){'Ciofile2'}
      let(:lockfile2){'Ciofile2.lock'}
      let(:start){::Cio::Cli.start([task, '--source', source2])}

      it 'sets default files location to working directory' do
        FileUtils.mkdir_p(tmp_dir)
        FileUtils.mkdir_p(tmp_dir_a)
        File.open(File.join(tmp_dir,"#{source2}"), 'w') {|f| f.write(complete_ciofile) }
        Dir.chdir(tmp_dir) do
          start
          ::Cio.file.should == File.join(tmp_dir,"#{source2}")
          ::Cio.lockfile.should == File.join(tmp_dir,"#{lockfile2}")
          ::Cio.cookbooks.should == cookbooks

          ::Cio.cookbooks.should match dir_regex
          ::Cio.file.should match dir_regex
          ::Cio.lockfile.should match dir_regex
        end
      end
    end
  end
end

