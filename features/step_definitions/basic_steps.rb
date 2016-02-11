Given(/^I am logged in as admin$/) do
  steps %(
  Given I am on the home page
  And I click on "Log_In"
  Then I should be on the "login" page
  And I fill in "user[username]" with "admin"
  And I fill in "user[password]" with "admin"
  And I click on "Log In"
  Then I should be on the "home" page
  )
end

Given(/^I am on the ([^"]*)$/) do |page|
  case page
  when 'home page'
    visit '/'
  end
end

And(/^I click on "([^"]*)"$/) do |element|
  click_link_or_button element
end

Then(/^I should be on the "([^"]*)" page$/) do |page|
  case page
  when 'Register'
    expect(current_path).to eq '/auth/register'
  when 'login'
    expect(current_path).to eq '/auth/login'
  when 'Menu'
    expect(current_path).to eq '/menu'
  when 'home page'
    expect(current_path).to eq '/'
  end
end

And(/^I fill in "([^"]*)" with "([^"]*)"$/) do |element, value|
  fill_in(element, with: value)
end

Then(/^show me the page$/) do
end

And(/^I should see "([^"]*)"$/) do |string|
  expect(page).to have_text string
end
