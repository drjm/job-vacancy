When(/^put "(.*?)" on the password$/) do |arg1|
  fill_in('Password:', :with => arg1)
end

When(/^put "(.*?)" on the confirmation password$/) do |arg1|
  fill_in('Password confirmation:', :with => arg1)
end

Then(/^see the error on the registration page$/) do
  page.should have_content('Invalid passwords')
end

Then(/^see the registration was success$/) do
  page.should have_content('User created')
end
