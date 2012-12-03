Feature: --source SOURCE

  Use the `--source SOURCE` (or `-s SOURCE`) option with these tasks to set the source path and filename.
  You can also use the format `--source=SOURCE` (or `-s=SOURCE`).

  Scenario Outline: Cio tasks that accept --source SOURCE
    When I run `cio help <task>`
    Then the stderr should not contain anything
    And the stdout should contain "<description>"
    And the stdout should contain "<default>"

  Examples:
    | task    | description                                                           | default              |
    | clean   | -s, [--source=SOURCE]  # Full path to any file with Ciofile contents. | # Default: ./Ciofile |
    | install | -s, [--source=SOURCE]  # Full path to any file with Ciofile contents. | # Default: ./Ciofile |
    | resolve | -s, [--source=SOURCE]  # Full path to any file with Ciofile contents. | # Default: ./Ciofile |
    | update  | -s, [--source=SOURCE]  # Full path to any file with Ciofile contents. | # Default: ./Ciofile |
