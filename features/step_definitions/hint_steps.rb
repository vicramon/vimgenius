Given(/^I go to the vim intro lesson page$/) do
  visit lesson_path(@lesson)
end

When(/^I press the right arrow key$/) do
  script = "e = $.Event('keyup'); e.keyCode = e.which = 39; $('body').trigger(e);"
  page.execute_script(script)
end

Then(/^I should see the first hint$/) do
  expect(page).to have_css(".show_hint span", count: 1)
end

Then(/^I should see the second hint$/) do
  expect(page).to have_css(".show_hint span", count: 2)
end
