Given(/^I am not logged in$/) do
  
end

When(/^I visit the home page$/) do
    visit '/'
end

Then(/^I should see a sign in link$/) do
  page.should have_content 'Sign in'
end

Then(/^I should see sign up links$/) do
  page.should have_content 'Sign up'
end

