Feature: As a candidate I want to put my specialties.

   Scenario: I register the app
     Given I visit the register page
     When I see the specialties field
     And charge data field
     Then finish the registration
