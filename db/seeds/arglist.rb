@lesson = Fabricate(:lesson,
          name: 'Vim Arglist',
          summary: %q[
            This lesson goes over Vim's arglist functionality.
          ],
          directions: %q[
Arglist is a feature of Vim that lets you specify a set of files then run commands on those files.

This can be especially useful for doing search and replace across multiple files or directories.

The arglist is initalized with whatever file you open Vim with. E.g, if you did `vim index.html`, your arglist would contain `index.html`.

Here are some of the common arglist commands you'll want to know:

* `:arg` to show the files in your current arglist
* `:argdo` to run a command on your arglist
* `:argadd` or `:arga` to add files to your arglist
* `:argdelete` or `:argd` to remove files from your arglist
* `:argdo update` to save all changes to your arglist
* `:argdo undo` to undo changes to your arglist
          ],
          done_message: %q[
            You did it! You are one more step on your way to becoming a Vim Genius.
          ]
         )

@level_1_commands = {
  ":arg" => "View arglist",
  ":argdo %s/sam/bob/g" => 'Replace "sam" with "bob" in arglist',
  ":arga names.rb or :argadd names.rb" => 'Add names.rb to arglist',
  ":argd * or :argdelete *" => 'Clear arglist',
  ":argdo update" => 'Save files in arglist',
  ":argdo undo" => 'Undo changes to arglist',
}

1.upto(1) do |number|
  create_commands(create_level(@lesson, number), instance_variable_get("@level_#{number}_commands"))
end


