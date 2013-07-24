Given /^I have a vim lesson$/ do
  @lesson = Fabricate(:lesson, name: 'Vim Intro')
  @level  = Fabricate(:level, name: "Level 1", lesson: @lesson)
  @command = Fabricate(:command, name: 'change word', keystroke: 'cw', level: @level)
  @command = Fabricate(:command, name: 'delete word', keystroke: 'cw', level: @level)
end
