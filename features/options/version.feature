Feature: --version

  Use the `--version` (or `-n`) option with these tasks to log version to stdout.

  Scenario Outline: Cio tasks that accept --version
    When I run `cio help <task>`
    Then the stderr should not contain anything
    And the stdout should contain "<description>"

  Examples:
    | task    | description                                                                      |
    | clean   | -v, [--version]        # Log version to stdout. |
    | install | -v, [--version]        # Log version to stdout. |
    | resolve | -v, [--version]        # Log version to stdout. |
    | update  | -v, [--version]        # Log version to stdout. |
    | verify  | -v, [--version]        # Log version to stdout. |
    | version | -v, [--version]      # Log version to stdout. |
