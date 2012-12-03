class LineFilter < SimpleCov::Filter
  def matches?(source_file)
    source_file.lines.count < filter_argument
  end
end

class ListFilter < SimpleCov::Filter
  def matches?(source_file)
    filter_argument.include? source_file.filename
  end
end

class RegexFilter < SimpleCov::Filter
  def matches?(source_file)
    source_file.filename =~ /#{filter_argument}/i
  end
end

class CoverageFilter < SimpleCov::Filter
  def matches?(source_file)
    source_file.covered_percent < filter_argument
  end
end

SimpleCov.start do

  project_name "Cio"
  refuse_coverage_drop
  merge_timeout 3600
  use_merging true
  # exclude these
  add_filter '/bin/'
  add_filter '/features/'
  add_filter '/spec/'
  add_filter '/tmp/'
  add_filter '/vendor/'

  add_filter 'cio/modules/dsl/cov_excluded'

  # any custom configs like groups and filters can be here at a central place
  add_group 'API', RegexFilter.new('modules\/|api\.rb')
  add_group 'CLI', RegexFilter.new('tasks\/thor')
  add_group 'Common', "common/"
  add_group 'Utility', "utility/"
  add_group 'Incomplete', CoverageFilter.new(100)
  add_group 'Long files' do |src_file|
    src_file.lines.count > 100
  end
  add_group 'Short files', LineFilter.new(5)

end
