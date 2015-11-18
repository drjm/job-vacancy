Feature: as a user i want to edit my data info.

Background: User has logged in.
  Given a registration page
  And put the name "Carlos R"
  And put the email "Carlos_r@gmail.com"
  And put the password "CarlOs93"
  And put the password confirm "CarlOs93"
  And put the specialties "PHP programmer"
  And end the registration
  And visit the homepage
  And log in as "Carlos_r@gmail.com"
  When access to the profile
  Then access to edit page


Scenario: User access to their profile and edit their email.
  When edit their email with "Carlos_93@gmail.com"
  Then access to their profile seeing their email modified with "Carlos_93@gmail.com"

Scenario: User access to their profile and edit their specialization
  When edit their specialties with "PHP programmer, Web programmer"
  Then access to their profile seeing their specialization modify with "PHP programmer, Web programmer"

Scenario: User access to their profile and edit their name
  When edit their name "Carlos Rodríguez"
  Then access to their profile seeing their name modified "Carlos Rodríguez"


Scenario: User access to their profile and edit their data, but cancel it.
  When edit their email "Carlos_93@gmail.com" and cancel the changes
  Then access to their profile seeing email with "Carlos_r@gmail.com"

Scenario: User access to their profile and edit their password
  When edit their password with "car93"
  Then access to their profile seeing their password modified with "car93".


