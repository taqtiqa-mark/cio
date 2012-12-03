Feature: Install Task

  Background:
    Given a directory named "app/production"
    And a file named "Ciofile" should not exist
    And a file named "Ciofile.lock" should not exist

  Scenario: Install a complete Ciofile
    Given a complete Ciofile
    When I run `cio install`
    Then a file named "Ciofile.lock" should exist
    And the exit status should be 0

#  Scenario: Install an incomplete Ciofile
#    Given an incomplete Ciofile
#    When I run `cio install`
#    Then a file named "Ciofile.lock" should not exist
#    Then the exit status should be 1
