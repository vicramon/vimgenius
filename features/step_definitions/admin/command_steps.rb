When(/^I fill in the command form$/) do
  fill_in "Name", with: "Delete two words"
  fill_in "Keystroke", with: "d 2 w"
end

Then(/^I see that command$/) do
  expect(find_field("Name")['value']).to eq "Delete two words"
end

Given(/^I have a command$/) do
  @command = Fabricate(:command, level: @level)
end

When(/^I click to edit that command$/) do
  click_link @command.name
end

Then(/^I am on that command's edit page$/) do
  @command = @command || Command.last
  expect(current_path).to eq edit_admin_lesson_level_command_path(@lesson, @level, @command)
end
