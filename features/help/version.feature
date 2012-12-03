Feature: Version Task

  Background:
    Given a directory named "app/production"

  Scenario: Run Cio help version task
    When I run `cio help version`
    Then the stderr should not contain anything
    And the stdout should contain exactly:
    """
    Usage:
      cio version

    Options:
      -q, [--quiet]        # Log some progress and all error messages to stdout or stderr.
      -l, [--loud]         # Log all progress and error messages to stdout or stderr.
      -r, [--raise=RAISE]  # Raise an Exception with given message.
      -v, [--version]      # Log version to stdout.

    Cio version

    """

