Given(/^I am a registered and logged in as admin$/) do
  steps %(
     Given I am on the home page
     And I click on "Register"
     Then I should be on the "Register" page
     And I fill in "Username" with "admin"
     And I fill in "Password" with "admin"
     And I click on "Create account"
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
  when 'Menu'
    expect(current_path).to eq '/menu'
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
