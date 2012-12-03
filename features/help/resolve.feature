Feature: Resolve Task

  Background:
    Given a directory named "app/production"

  Scenario: Run Cio help resolve task
    When I run `cio help resolve`
    Then the stderr should not contain anything
    And the stdout should contain exactly:
    """
    Usage:
      cio resolve

    Options:
      -s, [--source=SOURCE]  # Full path to any file with Ciofile contents.
                             # Default: ./Ciofile
      -q, [--quiet]          # Log some progress and all error messages to stdout or stderr.
      -l, [--loud]           # Log all progress and error messages to stdout or stderr.
      -r, [--raise=RAISE]    # Raise an Exception with given message.
      -v, [--version]        # Log version to stdout.

    Resolves specified cookbooks

    """
