When(/^edit their email with "(.*?)"$/) do |arg1|
  fill_in('Email:', :with => arg1)
  click_button('Accept')
end

Then(/^access to their profile seeing their email modified with "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end

Then(/^access to their profile seeing their specialization modify with "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end

When(/^edit their name "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^access to their profile seeing their name modified "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^edit their password with "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^access to their profile seeing their password modified with "(.*?)"\.$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^access to their profile seeing password with "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^edit their specialties with "(.*?)"$/) do |arg1|
  fill_in('Specialties:', :with => arg1)
  click_button('Accept')
end

When(/^edit their email "(.*?)" and cancel the changes$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^access to edit page$/) do
  visit "/edit"
end




