Given(/^create an a account with name "(.*?)", email "(.*?)", password\/confirmation password "(.*?)"\.$/) do |arg1, arg2, arg3|
  @user = User.new
  @user.name = arg1
  @user.email = arg2
  @user.password = ::BCrypt::Password.create(arg3)
  @user.blocked = false
  @user.date_blocked = nil
  @user.access_count = 3
  @user.save
end

Then(/^logout$/) do
  visit '/logout'
end

Given(/^a login page$/) do
  visit 'login'
end

Then(/^see the error "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end

When(/^try to login$/) do
  click_button ('Login')
end

When(/^stay on home page$/) do
  page.should have_content('pedro@gmail.com')
end


When(/^Login with "(.*?)" and password "(.*?)"$/) do |arg1, arg2|
  visit 'login'
  fill_in('Email:', :with => arg1)
  fill_in('Password:', :with => arg2)
  click_button ('Login')
end
