require 'vcr'
VCR.configure do |c|
  c.cassette_library_dir = 'features/cassettes'
  c.hook_into :fakeweb
  c.ignore_localhost = true
  c.default_cassette_options = { :record => :new_episodes,
                                 :re_record_interval => 86400 }
end

VCR.cucumber_tags do |t|
  t.tag '@vcr', use_scenario_name: true
end
