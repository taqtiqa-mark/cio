Feature: Install Task

  In order to understand clean Cio install behaviour
  As a user of Cio
  I want to have documented expected cli output

  Background:
    Given a directory named "app/production"
    And a file named "Ciofile.lock" should not exist

  Scenario: Install a complete Ciofile
    Given a complete Ciofile
    When I successfully run `cio install`
    Then the stdout should contain exactly:
    """
    """
    And a file named "Ciofile.lock" should exist
    And the file "Ciofile.lock" should contain exactly:
    """
    lockfile contents
    """

#  Scenario: Install an incomplete Ciofile
#    Given an incomplete Ciofile
#    When I run `cio install`
#    Then the stdout should contain:
#    """
#    """
#    And a file named "Ciofile.lock" should not exist

  Scenario: With the version option
    Given a complete Ciofile
    When I successfully run `cio install -v`
    Then the output should contain the installed version
