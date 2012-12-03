Feature: Clean Task

  In order to understand clean Cio install behaviour
  As a user of Cio
  I want to have documented expected cli output

  Background:
    Given a directory named "app/production/cookbooks/.cache"
    And a directory named "app/production/cookbooks"
    And I cd to "app/production"
    And a complete Ciofile
    And a complete Ciofile.lock

  Scenario: With the default options
    Given a file named "Ciofile" should exist
    And a file named "Ciofile.lock" should exist
    When I successfully run `cio clean`
    Then the stdout should not contain anything
    And the stderr should not contain anything
    And a directory named "cookbooks" should not exist
    And a file named "Ciofile" should exist
    And a file named "Ciofile.lock" should not exist

  Scenario: With the version option
    Given a file named "Ciofile" should exist
    And a file named "Ciofile.lock" should exist
    When I successfully run `cio clean -v`
    Then the output should contain the installed version
    And a directory named "cookbooks" should not exist
    And a file named "Ciofile" should exist
    And a file named "Ciofile.lock" should not exist

  Scenario: With the quiet option
    Given a file named "Ciofile" should exist
    And a file named "Ciofile.lock" should exist
    When I successfully run `cio clean -q`
    Then the stdout should contain "Start task api: clean"
    And the stdout should contain "End task api: clean"
    And the stderr should not contain anything
    And a directory named "cookbooks" should not exist
    And a file named "Ciofile" should exist
    And a file named "Ciofile.lock" should not exist

