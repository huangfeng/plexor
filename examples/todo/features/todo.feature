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

    Given @something that is:
      | complete | false |
    When toggle complete @something
    Then should contain:
      | complete | yes |

  Scenario: Get it undone

    Given @something that is:
      | complete | true |
    When toggle complete @something
    Then should contain:
      | complete | no |

  Scenario: More todo

    When create "something else"
    Then should contain:
      | text           | complete |
      | something      | no       |
      | something else | no       |

