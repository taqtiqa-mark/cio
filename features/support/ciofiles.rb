# Complete: This Ciofile has no further dependencies
def complete_ciofile
  "
site 'http://www.cookbooks.io'

cookbook 'mc-hostname'
"
end

def complete_lock_file
"
site:
  uri: http://www.cookbooks.io:80
  cookbooks:
    hostname:
      version: 0.0.1
      vendor: modcloth
      path: mc-hostname/qa-0.0.1.tar.xz
      md5: fgdsuytfmd5
      dependencies:

"
end

# Incomplete: This Ciofile has many further dependencies
def incomplete_ciofile
"
site 'http://www.cookbooks.io'

cookbook 'nd-cookbook-magento'
"
end
