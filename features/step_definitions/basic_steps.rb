Given(/^I am registerd as visitor$/) do
  user = User.create(username: 'Visitor',
                     password: 'password',
                     password_confirmation: 'password',
                     email: 'visitor@random.com',
                     phone_number: '12345667',
                     admin: false)
  login_as user
end

Given(/^I am registerd and logged out admin$/) do
  steps %q(
    Given I am registerd as admin
    And I am on the home page
    And I click on "Log_Out"
    Then I should be on the "home" page
    And I should see "Successfully logged out"
  )
end

Given(/^I am registerd as admin$/) do
  user = User.create(username: 'Admin', password: 'password', password_confirmation: 'password', admin: true)
  login_as user
end

Given(/^I am registerd and logged out visitor$/) do
  steps %q(
    Given I am registerd as visitor
    And I am on the home page
    And I click on "Log_Out"
    Then I should be on the "home" page
    And I should see "Successfully logged out"
  )
end

Given(/^the following categories exists$/) do |table|
  table.hashes.each do |hash|
     Category.create!(hash)
   end
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
  when 'Register Admin'
    expect(current_path).to eq '/auth/admin/register'
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
  save_and_open_page
end

And(/^I should see "([^"]*)"$/) do |string|
  expect(page).to have_text string
end
