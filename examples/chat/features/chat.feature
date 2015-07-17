Feature: Chat

  Scenario: Chatty people

    Then "Message" should not be empty

  Scenario: Who's talking

    Then "Thread" should contain:
      | [id] | [name]         |
      | t_1  | Jing and Bill  |
      | t_2  | Dave and Bill  |
      | t_3  | Bill and Brian |

  Scenario: Any news?

    Then "UnreadThread" count should be above "0"
