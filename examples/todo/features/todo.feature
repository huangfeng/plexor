Feature: TODO

  Scenario: There's nothing todo

    Then Todos should be empty

  Scenario: Something todo

    When create "something"
    Then Todos should include:
      | text     | something |
      | complete | false     |
