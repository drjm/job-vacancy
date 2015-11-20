Feature: As a user to a search that does not given a result, I want to see an error message.

Scenario: I do a search with criteria "Java Programmer" but that does an error mensaje

  Given a search page
  And add the criteria "Java Programmer"
  When I run the search
  Then show error message "no results found"