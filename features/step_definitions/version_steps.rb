Then /^the output should contain the installed version$/ do
  assert_partial_output(::Cio.version, all_output)
end

Then /^the stdout should contain the installed version$/ do
  assert_partial_output(::Cio.version, all_stdout)
end
