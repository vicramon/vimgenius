@lesson = Fabricate(:lesson,
          name: 'Vim Motion',
          summary: %q[
            This lesson covers the basic Vim motions.
          ],
          directions: %q[
This lesson will test your knowledge of Vim motions.
          ],
          done_message: %q[
            You did it! You are one more step on your way to becoming a Vim Genius.
          ]
         )

@level_1_commands = {
  "h"             => "Move cursor left",
  "l"             => "Move cursor right",
  "j"             => "Move cursor down",
  "k"             => "Move cursor up",
}

@level_2_commands = {
 "w" => "Next word",
 "e" => "End of word",
 "b" => "Beginning of word",
 "W" => "Next WORD (skip special characters)",
 "ge" => "End of previous word"
}

@level_3_commands = {
  "$" => "End of line",
  "^" => "Beginning of text on line",
  "0" => "Beginning of line",
  "}" => "Next paragraph",
  "}" => "Next paragraph",
  "(" => "Previous sentence",
  ")" => "Next sentence",
}


1.upto(3) do |number|
  create_commands(create_level(@lesson, number), instance_variable_get("@level_#{number}_commands"))
end


