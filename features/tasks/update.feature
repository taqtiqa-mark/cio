Feature: Update Task

  In order to understand clean Cio update behaviour
  As a user of Cio
  I want to have documented expected cli output

  Background:
    Given a directory named "app/production"

  Scenario: With the version option
    Given a complete Ciofile
    And a complete Ciofile.lock
    When I successfully run `cio update -v`
    Then the output should contain the installed version
