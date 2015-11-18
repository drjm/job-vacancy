Given(/^two deals in the database, "(.*?)", "(.*?)"$/) do |arg1, arg2|
  @job_offer = JobOffer.new
  @job_offer.owner = User.first
  @job_offer.title = arg1
  @job_offer.location = 'a nice job'
  @job_offer.description = 'a nice job'
  @job_offer.save
  @job_offer = JobOffer.new
  @job_offer.owner = User.first
  @job_offer.title = arg2
  @job_offer.location = 'a nice job'
  @job_offer.description = 'a nice job'
  @job_offer.save
end

Given(/^I visit job offers page$/) do
  visit "/job_offers/latest"
end

Given(/^add search criteria "(.*?)"$/) do |arg1|
  fill_in "q", :with => arg1
end

When(/^I run the search$/) do
  click_button("search-button")
end

Then(/^show (\d+) results$/) do |arg1|
  page.should have_content("Search Results: " + arg1)
end
