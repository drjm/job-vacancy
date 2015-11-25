Given(/^a user without postulations$/) do
  visit "/register"
  fill_in('Name:', :with => 'maria')
  fill_in('Email:', :with => 'maria@test.com')
  fill_in('Password:', :with => 'mariatest1')
  fill_in('Password confirmation:', :with => 'mariatest1')
  click_button('Create')
  visit "/login"
  fill_in('Email:', :with => 'maria@test.com')
  fill_in('Password:', :with => 'mariatest1')
  click_button('loginButton')
  page.should have_content('maria@test.com')
end

When(/^I ask to see my postulations$/) do
  visit "/job_offers/postulation"
end

Then(/^do not show me any postulation$/) do
  page.should_not have_link('Apply')
end

Given(/^a user with one postulation$/) do
  visit "/register"
  fill_in('Name:', :with => 'maria')
  fill_in('Email:', :with => 'maria@test.com')
  fill_in('Password:', :with => 'mariatest1')
  fill_in('Password confirmation:', :with => 'mariatest1')
  click_button('Create')
  visit "/login"
  fill_in('Email:', :with => 'maria@test.com')
  fill_in('Password:', :with => 'mariatest1')
  click_button('loginButton')
  
  visit "/job_offers/new"
  fill_in('Title:', :with => 'web programmer')
  fill_in('Location:', :with => 'Quilmes')
  fill_in('Description:', :with => 'full time')
  click_button('Create')
  
  visit "/job_offers/latest"
  click_link('Apply')
  fill_in('Applicant email:', :with => 'maria@test.com')
  click_button('Apply')
  page.should have_content('Contact information sent')
end

Then(/^shows a postulation$/) do
  page.should have_content('web programmer')
end

Given(/^a user with three postulations$/) do
  visit "/register"
  fill_in('Name:', :with => 'maria')
  fill_in('Email:', :with => 'maria@test.com')
  fill_in('Password:', :with => 'mariatest1')
  fill_in('Password confirmation:', :with => 'mariatest1')
  click_button('Create')
  visit "/login"
  fill_in('Email:', :with => 'maria@test.com')
  fill_in('Password:', :with => 'mariatest1')
  click_button('loginButton')
  
  visit "/job_offers/new"
  fill_in('Title:', :with => 'ruby programmer')
  fill_in('Location:', :with => 'CABA')
  fill_in('Description:', :with => 'se busca programador')
  click_button('Create')

  visit "/job_offers/new"
  fill_in('Title:', :with => 'senior programmer')
  fill_in('Location:', :with => 'Avellaneda')
  fill_in('Description:', :with => 'se busca senior')
  click_button('Create')

  visit "/job_offers/latest"
  all('a', :text => 'Apply')[1].click
  fill_in('Applicant email:', :with => 'maria@test.com')
  click_button('Apply')
  page.should have_content('Contact information sent')

  visit "/job_offers/latest"
  all('a', :text => 'Apply')[2].click
  fill_in('Applicant email:', :with => 'maria@test.com')
  click_button('Apply')
  page.should have_content('Contact information sent')

end

Then(/^showing three postulations$/) do
  page.should have_content('web programmer')
  page.should have_content('ruby programmer')
  page.should have_content('senior programmer')
end



Given(/^a user with postulations$/) do
  visit "/register"
  fill_in('Name:', :with => 'maria')
  fill_in('Email:', :with => 'maria@test.com')
  fill_in('Password:', :with => 'mariatest1')
  fill_in('Password confirmation:', :with => 'mariatest1')
  click_button('Create')
  visit "/login"
  fill_in('Email:', :with => 'maria@test.com')
  fill_in('Password:', :with => 'mariatest1')
  click_button('loginButton')
end

When(/^I postulate again to the same offer$/) do
  visit "/job_offers/latest"
  all('a', :text => 'Apply')[1].click
end

Then(/^displays Error Message "(.*?)"$/) do |arg1|
  page.should have_content('you are postulated to this offer')
end