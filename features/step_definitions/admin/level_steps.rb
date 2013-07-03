When(/^I fill in the level form$/) do
  fill_in "Name", with: "Level 1"
  fill_in "Sequence number", with: "1"
end

Then(/^I am on that level's edit page$/) do
  @level = Level.last
  expect(current_path).to eq edit_admin_lesson_level_path(@lesson, @level)
end

Then(/^that level is in the database$/) do
  expect(@level.name).to eq "Level 1"
end

Given(/^I have a level$/) do
  @level = Fabricate(:level, lesson: @lesson)
end

Given(/^I click on that level$/) do
  click_link @level.name
end

Given /^I go to edit that level$/ do
  visit edit_admin_lesson_level_path(@lesson, @level)
end

