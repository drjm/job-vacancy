Feature: as a user i want to see my data info
  Background:
    Given a registration page
    And put the name "Carlos"
    And put the email "Carlos@gmail.com"
    And put the password "CarlOs93"
    And put the password confirm "CarlOs93"
    And put the specialties "PHP programmer"
    And end the registration

  Scenario: User access to profile
    Given visit the homepage
    And log in as "Carlos@gmail.com"
    When access to the profile page
    Then see the name with "Carlos", email with "Carlos@gmail.com" and specialization with "PHP programmer"
