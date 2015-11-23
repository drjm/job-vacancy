Feature: As a candidate I want to see my history postulations.

  Scenario: I'm not postulated in any offer
    Given a user without postulations
    When I ask to see my postulations
    Then do not show me any postulation

  Scenario: I postulate in a offer
    Given a user with one postulation
    When I ask to see my postulations
    Then shows a postulation

   Scenario: I postulated in three offers
    Given a user with three postulations
    When I ask to see my postulations
    Then showing three postulations

    Scenario: I postulate two times to the same offer
     Given a user with postulations
     When I postulate again to the same offer
     Then displays Error Message "you are postulated to this offer"

