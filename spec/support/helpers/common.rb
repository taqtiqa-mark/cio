puts __FILE__
module ::Cio
  module Spec
    module Support
      module Helpers
        module Common

# This Ciofile contains all legal syntax.
# It is intended to be parsed, but neither resolved nor retrieved
# cookbook {name}, {version_constraint}, {options}
          def ciofile_spec
            "
site 'http://www.yours.com', 'http://www.cookbooks.io'
site 'http://www.others.com'

mysite = 'http://www.mine.com'

cookbook 'oc-timezone'
cookbook 'oc-timezone', '0.0.1', 'asjhdjhf70kj4328'
cookbook 'oc-timezone', '=0.0.1', 'asjhdjhf70kj4328'
cookbook 'oc-timezone', '>0.0.1'
cookbook 'oc-timezone', '>=0.0.1'
cookbook 'oc-timezone', '<0.0.1'
cookbook 'oc-timezone', '<=0.0.1'
cookbook 'oc-timezone', '~>0.0.1'
cookbook 'oc-timezone', '~>0.0.1', :site => 'http://www.yours.com'
cookbook 'oc-timezone', '~>0.0.1', :site => mysite
cookbook 'oc-timezone', '~>0.0.1', :depends_name => 'timezone'
cookbook 'oc-timezone', '~>0.0.1', :md5 => 'asjhdjhf70kj4328'
cookbook 'oc-timezone', '0.0.1', 'asjhdjhf70kj4328', 'for', 'the', 'future', :md5 => 'asjhdjhf70kj4328', :depends_name => 'timezone', :site => mysite
"
          end

# Complete: This Ciofile has no further dependencies.
# Its contents can be parsed (pass), resolved (pass) and retrieved (pass).
          def complete_ciofile
            "
site 'http://www.cookbooks.io'

cookbook 'mc-hostname'
"
          end

# Incomplete: This Ciofile has many further dependencies
# Its contents can be parsed (pass), resolved (fail) and retrieved (no-op).
          def incomplete_ciofile
"
site 'http://www.cookbooks.io'

cookbook 'nd-cookbook-magento'
"
          end
        end
      end
    end
  end
end