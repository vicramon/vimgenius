@lesson = Fabricate(:lesson,
          name: 'Vim Copy and Paste',
          summary: %q[
            This lesson goes over Vim's copy & paste functionality.
          ],
          directions: %q[
When you yank OR delete something in Vim it goes into the `"` register. This is the default register. This can be a problem when you yank something, then delete something else, then try to paste what you originally yanked.

To get to what you yanked, you will have to pull it from the yank register. The yank register goes from 0 to 9 and it functions like a stack. The most recent thing you yanked will be at 0, and the second most recent at 1, etc, all the way to 9.

You can also explicity name a register that you want to save yanked text to.
You can use any character a-z. For example, to save something to the `a` register you would do `"ayw`.

All of this will be tested in the upcoming level.
          ],
          done_message: %q[
            You did it! You are one more step on your way to becoming a Vim Genius.
          ]
         )

@level_1_commands = {
  "yw"             => "Yank word",
  "yy"             => "Yank line",
  "p"             => "Paste after cursor",
  "P"             => "Paste before cursor",
  ":reg or :register" => "Show yank register",
  "\"0p"             => "Paste from 0 register",
  "\"ap"             => "Paste from \"a\" register",
}

@level_2_commands = {
  'ctrl+r "'             => "Paste from default register in insert mode",
  'ctrl+r 0'             => "Paste from 0 register in insert mode",
  'ctrl+r a'             => "Paste from \"a\" register in insert mode",
}



1.upto(2) do |number|
  create_commands(create_level(@lesson, number), instance_variable_get("@level_#{number}_commands"))
end


