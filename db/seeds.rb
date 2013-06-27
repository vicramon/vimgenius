@lesson = Fabricate(:lesson,
          name: 'Vim Intro',
          summary: %q[
            Our original course offers testing corresponding to what you'll learn in VimTutor. It’s highly recommended you use VimTutor along with this lesson.
          ],
          directions: %q[
            This intro course is designed to go along with Vim's built in tutorial program, VimTutor. You should pull up VimTutor and come back here to quiz yourself after each lesson.
            <p> To open VimTutor, just open a terminal and type <code>vimtutor</code>.
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
  ":q"           => "Close file",
  ":q!"         => "Close file & don't save changes",
  ":w"           => "Save changes to file",
  ":wq or :x"  => "Save changes and close file",
  "x"             => "Delete character under cursor",
  "i"             => "Insert text under cursor",
  "I"             => "Insert text at beginning of line",
  "escape"        => "Exit insert mode",
  "a"             => "Append after cursor",
  "A"             => "Append after end of line",
}

@level_2_commands = {
  "dw"       =>  "Delete word",
  "d$ or D"  =>  "Delete to end of line",
  "w"         =>  "Go to next word",
  "$"         =>  "Go to end of text on current line",
  "^"         =>  "Go to beginning of text on current line",
  "0"         =>  "Go to beginning of current line",
  "2w"       =>  "Go two words forward",
  "3e"       =>  "Go to end of third word ahead",
  "d2w"     =>  "Delete two words",
  "dd"       =>  "Delete entire line",
  "2dd"     =>  "Delete two lines",
  "u"         =>  "Undo last change",
  "U"         =>  "Undo changes on entire line",
  "ctrl+r"    =>  "Redo changes",
}

@level_3_commands = {
  "p" => "Paste after cursor",
  "P" => "Paste before cursor",
  "r" => "Replace character under cursor",
  "cw" => "Change word",
  "c$ or C" => "Change to end of line",
  "c2w" => "Change two words",
}

@level_4_commands = {
 "50G or :50" => "Go to line 50",
 "G" => "Go to last line in file",
 "gg" => "Go to first line in file",
 "/waldo" => "Search for \"waldo\"",
 "n" => "Go to next search result",
 "N" => "Go to previous search result",
 "?carmen" => "Search backwards for \"carmen\"",
 "ctrl+o" => "Jump to previous location (jump back)",
 "ctrl+i" => "Jump to next location (jump forward)",
 "%" => "Go to matching parentheses or brackets",
 ":%s/bad/good" => "Replace bad with good in current line",
 ":%s/hi/bye/g" => "Replace hi with bye in entire file",
 ":%s/x/y/gc" => "Replace x with y in entire file, prompt for changes",
}

# Go back and add more to this level
@level_5_commands = {
  ":!ls" => "Run shell command ls",
  "v" => "Open visual mode",
  "vw" => "Visual select word",
  "vwd or vwx" => "Visual select word, then delete word",
  ":w play.rb" => "Save current file as \"play.rb\"",
  ":r hat.rb" => "Read in file \"hat.rb\"",
}

@level_6_commands = {
  "o" => "Open new line below",
  "O" => "Open new line above",
  "e" => "Go to end of word",
  "2e" => "Go to end of next word",
  "a" => "Append after cursor",
  "R" => "Enter replace mode",
  "yw" => "Yank word",
  "vwy" => "Visual select word, then yank",
  "y$" => "Yank to end of current line",
  "set ignorecase or set ic" => "Change search settings to ignore case",
  "set noignorecase or set noic" => "Change search settings to use case",
}

# add more commands to this level
@level_7_commands = {
  ":e sun.rb" => "Open file \"sun.rb\"",
  ":help w" => "Get help for \"w\" command",
  ":help e" => "Get help for \"e\" command",
}


1.upto(7) do |number|
  create_commands(create_level(number), instance_variable_get("@level_#{number}_commands"))
end
