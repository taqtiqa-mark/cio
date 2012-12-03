Given /^I run the "(.*?)" task$/ do |task|
  ::Cio::Cli.start(['version'])
end
