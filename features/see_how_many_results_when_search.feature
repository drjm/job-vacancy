Feature: As a candidate i want to see how many search results.

   Scenario:  load 3 deals in the database
  	Given  two deals in the database, "Java programmer", "PHP programmer"
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
   
   Scenario: I do a search that match several criteria
    Given I visit job offers page 
    And add search criteria "programmer"
    When I run the search
    Then show 3 results
