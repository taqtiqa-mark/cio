Given /^a complete Ciofile$/ do
  write_file('Ciofile', complete_ciofile)
end

Given /^a complete Ciofile.lock$/ do
  write_file('Ciofile.lock', complete_lock_file)
end

Given /^an incomplete Ciofile$/ do
  write_file('Ciofile', incomplete_ciofile)
end
Given /^an incomplete Ciofile.lock$/ do
  remove_file('Ciofile.lock')
end
