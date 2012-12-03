
shared_examples_for "a loud logger" do |task, expected_log|

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
      expected_log.each do |elem|
        @checklog.should include(elem)
      end
    end
  end

end

















