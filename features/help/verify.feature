Feature: Verify Task

  Background:
    Given a directory named "app/production"

  Scenario: Run Cio help verify task
    When I run `cio help verify`
    Then the stderr should not contain anything
    And the stdout should contain exactly:
    """
    Usage:
      cio verify

    Options:
      -p, [--path=PATH]      # Directory to install cookbooks to.
                             # Default: ./
      -s, [--source=SOURCE]  # Full path to any file with Ciofile contents.
                             # Default: ./Ciofile
      -q, [--quiet]          # Log some progress and all error messages to stdout or stderr.
      -l, [--loud]           # Log all progress and error messages to stdout or stderr.
      -r, [--raise=RAISE]    # Raise an Exception with given message.
      -v, [--version]        # Log version to stdout.

    Verify resolved and installed cookbooks

    """

