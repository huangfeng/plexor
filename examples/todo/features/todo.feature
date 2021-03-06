Feature: TODO

  Background:

    Given @store "Todo"

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
      | [text]         | [complete] |
      | something      | no         |
      | something else | no         |

  Scenario: I changed my mind

    Given @id of:
      | text | something |
    When update text @id to "something different"
    Then should contain:
      | text | something different |

  Scenario: It's a wrap

    When toggle complete all
    Then should contain:
      | [text]              | [complete] |
      | something different | yes        |
      | something else      | yes        |

  Scenario: Let's cleanup something

    Given @id of:
      | text | something different |
    When destroy @id
    Then should not contain:
      | text     | something different |

  Scenario: Let's cleanup all done

    When destroy completed
    Then should be empty
