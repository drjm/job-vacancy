Feature: As a User i want when fail 3 times my password the account blocks for 24hs.

  Background: have an account  
    Given a registration page
    And create an a account with name "pedro", email "pedro@gmail.com", password/confirmation password "pedro1586".
    Then logout

  Scenario: Fail 1 time the password  
    Given a login page
    And put the email "pedro@gmail.com"
    When put the password "pedro"
    And try to login
    Then see the error "Incorrect password you left 2 trys"

