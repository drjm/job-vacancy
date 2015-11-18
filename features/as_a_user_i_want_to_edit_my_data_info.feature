Feature: as a user i want to edit my data info.

Background: User has logged in.
  Given a registration page
  And put the name "Carlos"
  And put the email "Carlos@gmail.com"
  And put the password "CarlOs93"
  And put the password confirm "CarlOs93"
  And put the specialties "PHP programmer"
  And end the registration
  And visit the homepage
  And log in as "Carlos@gmail.com"
  When access to the profile page
  Then access to edit page


Scenario: User access to their profile and edit their email.
  When edit their email with "Carlos_93@gmail.com"
  Then access to their profile seeing their email modified with "Carlos_93@gmail.com"


