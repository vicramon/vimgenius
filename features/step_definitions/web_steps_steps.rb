When(/^I follow "(.*?)"$/) do |link|
  click_link link
end

When(/^I press "(.*?)"$/) do |text|
  click_button text
end

And "I debug" do
  require 'pry'; binding.pry
end

And "I view" do
  page.save_and_open_page
end

Then /^I see "(.*?)" on the page$/ do |text|
  expect(page).to have_content(text)
end

And /^I sleep$/ do
  sleep 5
end

