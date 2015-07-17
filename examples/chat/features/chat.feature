Feature: Chat

  Background:

    Given @store "Message"

  Scenario: Chatty people

    Then should not be empty

  Scenario: Say what?
#
#    When create message "what?" in "t_1"
#    Then should contain:
#    |||
