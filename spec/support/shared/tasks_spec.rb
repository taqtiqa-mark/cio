shared_examples 'the resolve task API sequence' do
  let(:thor_hash){ Thor::CoreExt::HashWithIndifferentAccess }
  it{ any_instance_of(::Cio::Api){|a| proxy(a).config(is_a(thor_hash)){|a| a.should be_a(::Cio::Api)}}; start }
  it{ any_instance_of(::Cio::Api){|a| proxy(a).parse_dsl_file{|a| a.should be_a(::Cio::Api)}}; start }
  it{ any_instance_of(::Cio::Api){|a| proxy(a).solve{|a| a.should be_a(::Cio::Api)}} ; start }
end

shared_examples 'the verify task API sequence' do
  it_behaves_like 'the resolve task API sequence'
  it{ any_instance_of(::Cio::Api){|a| proxy(a).get{|a| a.should be_a(::Cio::Api)}} ; start }
  it{ any_instance_of(::Cio::Api){|a| proxy(a).verify{|a| a.should be_a(::Cio::Api)}} ; start }
end
