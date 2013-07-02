__END__

@lesson = Fabricate(:lesson,
          name: 'Vim Intermediate',
          summary: %q[
            This is an intermediate course we designed to cover more more of Vim's practical commands.
          ],
          directions: %q[
            Before beginning this lessons you ought to be familiar with the Vim basics. Some of these commands you may know, and some may be new to you. But hopefully they will all be useful.
          ]
         )

@level_1_commands = {
  "h"             => "Move cursor left",
  "l"             => "Move cursor right",
  "j"             => "Move cursor down",
  "k"             => "Move cursor up",
  ":q"           => "Close file",
  ":q!"         => "Close file, don't save changes",
  ":w"           => "Save changes to file",
  ":wq or :x"  => "Save changes and close file",
  "x"             => "Delete character at cursor",
  "i"             => "Insert at cursor",
  "I"             => "Insert at beginning of line",
  "escape"        => "Exit insert mode",
  "a"             => "Append at cursor",
  "A"             => "Append at end of line",
}


1.upto(7) do |number|
  create_commands(create_level(@lesson, number), instance_variable_get("@level_#{number}_commands"))
end


