@lesson = Fabricate(:lesson,
          name: 'Vim Intro',
          summary: %q[
            Our original course offers testing corresponding to what you'll learn in VimTutor. It’s highly recommended you use VimTutor along with this lesson.
          ],
          directions: %q[
            This intro course is designed to go along with Vim's built in tutorial program, VimTutor. You pull up VimTutor and come back here to quiz yourself after each lesson.
            To open VimTutor, just open a terminal and type  vimtutor.
          ]
         )

def create_level(number)
  Fabricate(:level,
            name:   "Level #{number.to_s}",
            lesson: @lesson,
            sequence_number: number)
end

def create_commands(level, commands)
  commands.each do |keystroke, name|
    Fabricate(:command,
              level: level,
              keystroke: keystroke,
              name: name)
  end
end

@level_1_commands = {
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

@level_2_commands = {
  "d w"       =>  "Delete word",
  "d $ or D"  =>  "Delete to end of line",
  "w"         =>  "Go to next word",
  "e"         =>  "Go to end of word",
  "$"         =>  "Go to end of text on current line",
  "^"         =>  "Go to beginning of text on current line",
  "0"         =>  "Go to beginning of current line",
  "2 w"       =>  "Go two words forward",
  "3 e"       =>  "Go to end of third word ahead",
  "d 2 w"     =>  "Delete two words",
  "d d"       =>  "Delete entire line",
  "2 d d"     =>  "Delete two lines",
  "u"         =>  "Undo last change",
  "U"         =>  "Undo changes on entire line",
  "ctrl+r"    =>  "Redo changes",
}

@level_3_commands = {
  "p" => "Paste after cursor",
  "P" => "Paste before cursor",
  "r" => "Replace character under cursor",
  "c w" => "Change word",
  "c $ or C" => "Change to end of line",
  "c 2 w" => "Change two words",
}

@level_4_commands = {
 "5 0 G or : 5 0" => "Go to line 50",
 "G" => "Go to last line in file",
 "g g" => "Go to first line in file",
 "/ w a l d o" => "Search for \"waldo\"",
 "n" => "Go to next search result",
 "N" => "Go to previous search result",
 "? c a r m e n" => "Search backwards for \"carmen\"",
 "ctrl+o" => "Jump to previous location (jump back)",
 "ctrl+i" => "Jump to next location (jump forward)",
 "%" => "Go to matching parentheses or brackets",
 ": % s / b a d / g o o d" => "Replace bad with good in current line",
 ": % s / h i / b y e / g" => "Replace hi with bye in entire file",
 ": % s / x / y / g c" => "Replace x with y in entire file, prompt for changes",
}


1.upto(4) do |number|
  create_commands(create_level(number), instance_variable_get("@level_#{number}_commands"))
end
