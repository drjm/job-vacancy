Feature: As a candidate i want to see how many search results.

   Scenario:  load 3 deals in the database
  	Given  three deals in the database, "Web programmer", "Java programmer", "PHP programmer"
  	And I visit job offers page
  	Then show 3 results


