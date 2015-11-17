Given(/^a registration page$/) do
  visit '/register'
end

Given(/^put the name "(.*?)"$/) do |arg1|
  fill_in('Name:', :with => arg1)
end	

Given(/^put the email "(.*?)"$/) do |arg1|
  fill_in('Email:', :with => arg1)	
end

Given(/^put the password "(.*?)"$/) do |arg1|
   fill_in('Password:', :with => arg1)
end

Given(/^put the password confirm "(.*?)"$/) do |arg1|
  fill_in('Password confirmation:', :with => arg1)
end

Given(/^end the registration$/) do
  click_button ("Create")
end

Given(/^visit the homepage$/) do
  visit "/"
end

Given(/^put the specialties "(.*?)"$/) do |arg1|
  fill_in('Specialties:', :with => arg1)
end

Given(/^log in as "(.*?)"$/) do |arg1|
  click_link 'Login'
  fill_in('Email:', :with => arg1)
  fill_in('Password:', :with => "CarlOs93")
  click_button("Login")	
end

When(/^access to the profile page$/) do
  click_link 'Carlos@gmail.com'
end


Then(/^see the name with "(.*?)", email with "(.*?)" and specialization with "(.*?)"$/) do |arg1, arg2, arg3|
  page.should have_content(arg1)
  page.should have_content(arg2)
  page.should have_content(arg3)
end