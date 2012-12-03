Feature: --quite

  Use the `--quite` (or `-q`) option with these tasks to log some progress and all error messages to stdout or stderr.

  Scenario Outline: Cio tasks that accept --quite
    When I run `cio help <task>`
    Then the stderr should not contain anything
    And the stdout should contain "<description>"

  Examples:
    | task    | description                                                                      |
    | clean   | -q, [--quiet]          # Log some progress and all error messages to stdout or stderr. |
    | install | -q, [--quiet]          # Log some progress and all error messages to stdout or stderr. |
    | resolve | -q, [--quiet]          # Log some progress and all error messages to stdout or stderr. |
    | update  | -q, [--quiet]          # Log some progress and all error messages to stdout or stderr.  |
    | verify  | -q, [--quiet]          # Log some progress and all error messages to stdout or stderr.  |
    | version | -q, [--quiet]        # Log some progress and all error messages to stdout or stderr. |
