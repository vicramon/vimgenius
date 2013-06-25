When(/^I follow "(.*?)"$/) do |link|
  click_link link
end

When(/^I press "(.*?)"$/) do |text|
  click_button text
end

