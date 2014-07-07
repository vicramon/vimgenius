And /^I type "cw"$/ do
  sleep 2
  press_key(99)
  press_key(119)
  trigger_keyup
end

And /^I type "dw"$/ do
  expect(page).to have_content "delete word"
  press_key(100)
  press_key(119)
  trigger_keyup
end

Then 'I should see the next button' do
  expect(page).to have_link("Next")
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
