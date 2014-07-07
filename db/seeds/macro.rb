@lesson = Fabricate(:lesson,
          name: 'Vim Macros',
          summary: %q[
            This lesson goes over Vim macros.
          ],
          directions: %q[
Macros let you record a key sequence then play it again on different text.

To start recording a marco, type `q` then the register you want to save it to. It's easy to just do `qq`. Once you do this, you'll see "recording" in your status bar.

Next, you type the key sequence you want to save, then hit `q` again to stop recording.

To play your macro, type `@q`. To keep playing it, you can use the `.` command (this always repeats your last command).

You can also play a macro across a visual selection. Just make the selection, they type `:normal @q`. The normal stands for Normal mode. Note that you won't actually see the `:` after you type it, you'll see `'<,>'` intead since you will be in visual selection mode.

Here's a quick recap:

* `qq` to start recording
* `q` to stop recording
* `@q` to play the macro

          ],
          done_message: %q[
            You did it! You are one more step on your way to becoming a Vim Genius.
          ]
         )

# fix control r issue
@level_1_commands = {
  "qq" => "Start recording macro in \"q\" register",
  "q" => "Stop recording macro",
  "@q" => "Play \"q\" macro",
  ":normal @q" => "Play \"q\" macro across visual selection",
}

1.upto(1) do |number|
  create_commands(create_level(@lesson, number), instance_variable_get("@level_#{number}_commands"))
end
