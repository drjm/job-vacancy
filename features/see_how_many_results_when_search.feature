Feature: As a candidate i want to see how many search results.

   Scenario:  load 3 deals in the database
  	Given  three deals in the database, "Web programmer", "Java programmer", "PHP programmer"
  	And I visit job offers page
  	Then show 3 results

   Scenario: I do a search that does not match criteria
    Given I visit job offers page 
    And add search criteria "Phyton"
    When I run the search
    Then show 0 results

   Scenario: I make a match search criteria
    Given I visit job offers page 
    And add search criteria "web"
    When I run the search
    Then show 1 results

