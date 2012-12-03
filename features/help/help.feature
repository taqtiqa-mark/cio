Feature: Help Output

  In order to understand the Cio commands and options
  As a user of Cio
  I want to have Cio help at the command line

  Background:
    Given a directory named "app/production"
    And a file named "Ciofile" should not exist
    And a file named "Ciofile.lock" should not exist

  Scenario: Run Cio without a task
    When I run `cio`
    Then the stderr should not contain anything
    And the stdout should contain exactly:
    """
    Tasks:
      cio clean        # Delete lock file, cache and install paths, then install
      cio help [TASK]  # Describe available tasks or one specific task
      cio install      # Resolves and installs specified cookbooks
      cio resolve      # Resolves specified cookbooks
      cio update       # Resolves and updates specified cookbooks
      cio verify       # Verify resolved and installed cookbooks
      cio version      # Cio version

    Options:
      -q, [--quiet]        # Log some progress and all error messages to stdout or stderr.
      -l, [--loud]         # Log all progress and error messages to stdout or stderr.
      -r, [--raise=RAISE]  # Raise an Exception with given message.
      -v, [--version]      # Log version to stdout.


    """

  Scenario: Run Cio help task
    When I run `cio help`
    Then the stderr should not contain anything
    And the stdout should contain exactly:
    """
    Tasks:
      cio clean        # Delete lock file, cache and install paths, then install
      cio help [TASK]  # Describe available tasks or one specific task
      cio install      # Resolves and installs specified cookbooks
      cio resolve      # Resolves specified cookbooks
      cio update       # Resolves and updates specified cookbooks
      cio verify       # Verify resolved and installed cookbooks
      cio version      # Cio version

    Options:
      -q, [--quiet]        # Log some progress and all error messages to stdout or stderr.
      -l, [--loud]         # Log all progress and error messages to stdout or stderr.
      -r, [--raise=RAISE]  # Raise an Exception with given message.
      -v, [--version]      # Log version to stdout.


    """
