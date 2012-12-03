require 'spec_helper'

module ::Cio
  describe '.file' do
    subject{ ::Cio }
    # TODO: These two its examples fail randomly across spec runs.
    it{ should respond_to :file}
    it{ should respond_to :cookbooks}
    it{ should respond_to :lockfile}
    it{ should respond_to :manifest}
  end
end

