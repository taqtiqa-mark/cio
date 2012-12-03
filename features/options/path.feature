Feature: --path PATH

  Use the `--path PATH` (or `-p PATH`) option with these tasks to set the install destination.
  You can also use the format `--path=PATH` (or `-p=PATH`).

  Scenario Outline: Cio tasks that accept --path option
    When I run `cio help <task>`
    Then the stderr should not contain anything
    And the stdout should contain "<description>"
    And the stdout should contain "<default>"

  Examples:
    | task    | description                                                 | default       |
    | clean   | -p, [--path=PATH]      # Directory to install cookbooks to. | # Default: ./ |
    | install | -p, [--path=PATH]      # Directory to install cookbooks to. | # Default: ./ |
    | update  | -p, [--path=PATH]      # Directory to install cookbooks to. | # Default: ./ |
