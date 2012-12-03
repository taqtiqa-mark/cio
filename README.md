# Cio

### Bundling cookbooks for production deployments. Fast. Reliable. [![Build Status](https://travis-ci.org/taqtiqa-admin/cio.png?branch=master)](https://travis-ci.org/taqtiqa-admin/cio)

## Installation

Add this line to your application's Gemfile:

    gem 'cio'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cio

## Usage

    cio help

## Development setup

  See [CONTRIBUTING][]

## Supported Ruby versions

This library aims to support and is [tested against][travis] the following Ruby
implementations:

* MRI 1.8.7
* MRI 1.9.2
* MRI 1.9.3
* [JRuby][]
* [Rubinius][]

If something doesn't work on one of these interpreters, it should be considered
a bug.

This library may inadvertently work (or seem to work) on other Ruby
implementations, however support will only be provided for the versions listed
above.

If you would like this library to support another Ruby version, you may
volunteer to be a maintainer. Being a maintainer entails making sure all tests
run and pass on that implementation. When something breaks on your
implementation, you will be personally responsible for providing patches in a
timely fashion. If critical issues for a particular implementation exist at the
time of a major release, support for that Ruby version may be dropped.

## Copyright

Copyright (c) 2012 [Mark Van de Vyver](mailto:mark@taqtiqa.com).
See [LICENSE][] for details.

  [license]:        https://github.com/taqtiqa/cio/blob/master/LICENSE.md
  [contributing]:   https://github.com/taqtiqa/cio/blob/master/CONTRIBUTING.md
  [travis]:         http://travis-ci.org/technoweenie/faraday
  [jruby]:          http://jruby.org/
  [rubinius]:       http://rubini.us/
