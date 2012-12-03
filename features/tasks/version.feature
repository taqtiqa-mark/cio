Feature: Version Task

  In order to understand clean Cio install behaviour
  As a user of Cio
  I want to have documented expected cli output

  Scenario Outline: Using any option
    Given I successfully run `cio version <option>`
    Then the stderr should not contain anything
    And the stdout should contain the installed version

  Examples:
    | option |
    |        |
    | -v     |
    | -q     |
    | -l     |

  Scenario: Using the --quite option
    Given I successfully run `cio version -q`
    Then the stderr should not contain anything
    And the stdout should contain the installed version
    And the stdout should contain "Log level quiet"

  Scenario: Using the --loud option
    Given I successfully run `cio version -l`
    Then the stderr should not contain anything
    And the stdout should contain the installed version
    And the stdout should contain "Log level loud"

  Scenario: Using the --quite and --loud options
    Given I successfully run `cio version -q -l`
    Then the stderr should not contain anything
    And the stdout should contain the installed version
    And the stdout should contain "Log level loud"

  Scenario: Using the --quite and --raise options
    Given I run `cio version -q -r xyz`
    Then the stderr should not contain anything
    And the stdout should contain:
    """
    ---
    Log level quiet
    Start task api: version
    Cio caught exception xyz
    """

  Scenario: Using the --loud and --raise options
    Given I run `cio version -l -r abc`
    Then the stderr should not contain anything
    And the stdout should contain:
    """
    ---
    Log level loud
    Start task api: version
    Cio caught exception abc
    """
