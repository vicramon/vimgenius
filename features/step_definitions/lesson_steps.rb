When /^I fill in the lesson form$/ do
  fill_in :lesson_name, with: 'Vim Basics'
  fill_in :lesson_summary, with: "Learn the basics."
end

When /^I click to submit the lesson form$/ do
  click_button 'Create Lesson'
end

When /^I click to update that lesson$/ do
  click_button 'Update Lesson'
end

Then /^I am on the admin lessons page$/ do
  expect(current_path).to eq admin_lessons_path
end

Then /^I see that lesson$/ do
  expect(page).to have_content "Vim Basics"
end

Given(/^I have a lesson$/) do
  @lesson = Fabricate(:lesson)
end

When(/^I click on that lesson$/) do
  click_link @lesson.name
end

Then /^I see the lesson completed page$/ do
  expect(page).to have_content("You're done")
end

Then /^I am on the command prompt page$/ do
  expect(page).to have_content "For a hint"
end
