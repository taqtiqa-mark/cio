Feature: --clean

  Use the `--clean` (or `-c`) option with these tasks to set the install destination.

  Background:
    Given a directory named "app/production"
    And a complete Ciofile

  Scenario Outline: Cio tasks that accept --clean option
    When I run `cio help <task>`
    Then the stderr should not contain anything
    And the stdout should contain "<description>"

  Examples:
    | task    | description                                                 | default       |
    | install | -p, [--path=PATH]      # Directory to install cookbooks to. | # Default: ./ |
