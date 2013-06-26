
lesson = Fabricate(:lesson,
          name: 'Vim Intro',
          summary: %q[
            Our original course offers testing corresponding to what you'll learn in VimTutor. It’s highly recommended you use VimTutor along with this lesson.
          ],
          directions: %q[
            This intro course is designed to go along with Vim's built in tutorial program, VimTutor. You pull up VimTutor and come back here to quiz yourself after each lesson.
            To open VimTutor, just open a terminal and type  vimtutor.
          ]
         )

level = Fabricate(:level,
          name: "Level 1",
          lesson: lesson,
          sequence_number: 1
         )

commands = {
  "h"             => "Move cursor left",
  "l"             => "Move cursor right",
  "j"             => "Move cursor down",
  "k"             => "Move cursor up",
  ": q"           => "Close file",
  ": q !"         => "Close file & don't save changes",
  ": w"           => "Save changes to file",
  ": w q or : x"  => "Save changes and close file",
  "x"             => "Delete character under cursor",
  "i"             => "Insert text under cursor",
  "I"             => "Insert text at beginning of line",
  "escape"        => "Exit insert mode",
  "a"             => "Append after cursor",
  "A"             => "Append after end of line",
}

commands.each do |keystroke, name|
  Fabricate(:command,
            level: level,
            keystroke: keystroke,
            name: name)
end
