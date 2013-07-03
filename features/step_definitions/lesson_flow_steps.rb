And /^I clear the database$/ do
  Lesson.destroy_all
  Level.destroy_all
  Command.destroy_all
end

And /^I type "cw"$/ do
  press_key(99)
  press_key(119)
  trigger_keyup
end

And /^I click to view the next command$/ do
  sleep 1
  click_link "Next"
end

And /^I hit the enter key$/ do
  press_enter
end

And /^I type "c2w"$/ do
  press_key(99)
  press_key(50)
  press_key(119)
  trigger_keyup
end


def trigger_keyup
  script = "e = $.Event('keyup'); e.keyCode= 13; $('body').trigger(e);"
  page.execute_script(script)
end


def press_key(key_code)
  script = "e = $.Event('keypress'); e.keyCode = #{key_code}; $('body').trigger(e);"
  page.execute_script(script)
end

def press_enter
  script = "e = $.Event('keydown'); e.keyCode = 13; $('body').trigger(e);"
  page.execute_script(script)
end
