Feature: Chat

  Scenario: Chatty people

    Given @store "Message"
    Then should not be empty

  Scenario: Who's talking

    Given @store "Thread"
    Then should contain:
      | [id] | [name]         |
      | t_1  | Jing and Bill  |
      | t_2  | Dave and Bill  |
      | t_3  | Bill and Brian |
