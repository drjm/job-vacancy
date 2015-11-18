Feature: As a candidate I want to see my history postulations.

  Scenario: I'm not postulated in any offer
    Given a user without postulations
    When I ask to see my postulations
    Then do not show me any postulation