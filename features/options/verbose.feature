Feature: --verbose

  Use the `--verbose` (or `-v`) option with these tasks to log all progress and all error messages to stdout or stderr.

  Scenario Outline: Cio tasks that accept --verbose
    When I run `cio help <task>`
    Then the stderr should not contain anything
    And the stdout should contain "<description>"

  Examples:
    | task    | description                                                                      |
    | clean   | -l, [--loud]           # Log all progress and error messages to stdout or stderr.    |
    | install | -l, [--loud]           # Log all progress and error messages to stdout or stderr. |
    | resolve | -l, [--loud]           # Log all progress and error messages to stdout or stderr. |
    | update  | -l, [--loud]           # Log all progress and error messages to stdout or stderr. |
    | verify  | -l, [--loud]           # Log all progress and error messages to stdout or stderr. |
    | version | -l, [--loud]         # Log all progress and error messages to stdout or stderr.    |
