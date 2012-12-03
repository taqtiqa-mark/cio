## Contributing

### Setup common ruby

From scratch, i.e. without rbenv or rbenv_build:

1. Fork it.
2. Clone your cio repo.
3. Install rbenv and rbenv_build
```console
cd ~
git clone git://github.com/sstephenson/rbenv.git .rbenv
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
```
4. Install required Ruby version
```console
cd cio
rbenv install `cat .rbenv-version`
rbenv rehash
```

To Remove installed Ruby Version and installed gems
```console
rm -rf ~/.rbenv/versions/`cat .rbenv-version`
cd cio
rm -rf vendor
ls | grep -v bin/cio | xargs rm
```

### Setup development gems

1. Install and configure [Bundler](http://gembundler.com/)
```console
gem install bundler
bundle config path vendor
bundle config bin .bundle/bin
bundle config shebang ruby-local-exec
bundle config disable_shared_gems 1
```
2. Install required gems
```console
bundle install
```

You should be able to run the tests now:

```console
bundle exec rake
```

Cio uses [RSpec 2](http://github.com/rspec/rspec) for unit tests.
The specs are written in a very "focused" style, each spec is concerned only with
exercising the object under test, using mocks as necessary.
You can run the specs using `rake spec`.

[Cucumber](http://cukes.info/) is used for end-to-end full stack integration tests
that also function as Cio's documentation.

### Making a pull request

1. Create you changes using a [gitflow][] feature workflow
1. Create a GitHub Pull Request from the remote feature branch

Alternatively:

1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create new Pull Request

## Problems running bundle install?

If you get an error while running `bundle install`, it may be one of the
"extras" gems which are not required for development.
Try installing it without these gems.

```console
bundle install --without extras
```

If you are getting an error installing `rb-fsevent` gem, you may want to
temporarily change the Gemfile to use the pre-release version of the gem.

```ruby
gem 'rb-fsevent', '0.9.0.pre4'
```

  [gitflow]:        https://github.com/nvie/gitflow
