Feature: Exit Statuses

  In order to understand Cio exit statuses values
  As a user of Cio
  I want to have documented all expected cli exit statuses

  Scenario Outline: Cio help commands exit status values
    When I run `<cmd>`
    Then the exit status should be <exit_status>
  Examples:
    | cmd              | exit_status |
    | cio              | 1           |
    | cio help         | 0           |
    | cio help clean   | 0           |
    | cio help install | 0           |
    | cio help resolve | 0           |
    | cio help update  | 0           |
    | cio help verify  | 0           |
    | cio help version | 0           |
