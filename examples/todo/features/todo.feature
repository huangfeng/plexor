Feature: TODO

  Background:

    Given @store "Todo"
    And @on "change"

  Scenario: There's nothing todo

    Then should be empty

  Scenario: Something todo

    When create "something"
    Then should contain:
      | text     | something |
      | complete | no        |

  Scenario: Get it done

    Given @something that is
      | complete | false |
    When toggle complete @something
    Then @something.complete should be true