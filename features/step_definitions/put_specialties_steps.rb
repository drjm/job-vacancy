Given(/^I visit the register page$/) do
  visit "/register"
end

When(/^I see the specialties field$/) do
  page.should have_content('Specialties')
end

When(/^charge data field$/) do
  fill_in('Name:', :with => 'jose')	
  fill_in('Email:', :with => 'prueba@test.com')
  fill_in('Password:', :with => 'pass')
  fill_in('Password confirmation:', :with => 'pass')
  fill_in('Specialties:', :with => 'python')
end

Then(/^finish the registration$/) do
  click_button('Create')
  page.should have_content('Job Vacancy Board')
end
