Feature: Resolve Task

  In order to understand clean Cio resolve behaviour
  As a user of Cio
  I want to have documented expected cli output

  Background:
    Given a directory named "app/production"
    And a file named "Ciofile.lock" should not exist

  Scenario: With the version option
    Given a complete Ciofile
    When I successfully run `cio resolve -v`
    Then the output should contain the installed version
