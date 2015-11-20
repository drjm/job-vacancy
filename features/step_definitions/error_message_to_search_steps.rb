Given(/^a search page$/) do
  visit "/job_offers/latest"
end

Given(/^add the criteria "(.*?)"$/) do |arg1|
  fill_in "q", :with => arg1
end

Then(/^show error message "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end
