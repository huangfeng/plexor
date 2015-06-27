Feature: TODO

  Background:

    Given @store Todo
    And @once change

  Scenario: There's nothing todo

    Then should be empty

  Scenario: Something todo

    When create "something"
    Then should include:
      | text     | something |
      | complete | false     |
