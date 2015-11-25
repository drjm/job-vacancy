Feature: As a user i want the password have 8 characters at minimum, and possess letters and numbers

  Background: user on registration page
    Given a registration page
    And put the name "Fernando"
    And put the email "fernando@gmail.com"


  Scenario: Put a password with 6 characters
    When put "fer96y" on the password
    And put "fer96y" on the confirmation password
    And finish the registration
    Then see the error on the registration page


  Scenario: Put a password with 8 characters without letters
    When put "73496105" on the password
    And put "73496105" on the confirmation password
    And finish the registration
    Then see the error on the registration page


  Scenario: Put a password with 8 characters without numbers
    When put "fernando" on the password
    And put "fernando" on the confirmation password
    And finish the registration
    Then see the error on the registration page


  Scenario: Put a password with 8 characters with numbers and letters
    When put "fer96yTo" on the password
    And put "fer96yTo" on the confirmation password
    And finish the registration
    Then see the registration was success