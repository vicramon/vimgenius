@lesson = Fabricate(:lesson,
          name: 'Rails Vim',
          summary: %q{
            This lesson covers Rails Vim, a plugin by Tim Pope.
          },
          directions: %q{If you use Rails, rails.vim is a must-know. It greatly simplifies navigation in a Rails app and it gives you many handy shortcuts.

Here's the basic gist of it:

* `:R` is the prefix for your main rails navigation commands.
* `:RV file_name` will do a vertical split
* `:RS file_name` will do a horizontal split
* `:RT file_name` will open the file in a new tab

There are commands that will take you to specific directories:

* `:Rview` or `Rvi` will give you views
* `:Rcontroller` or `Rco` will give you controllers
* `:Rmodel` or `Rmo` will give you models

These commands can be paired to create the following:

* `:RVvi home/index.html` would open index.html in a vertical split <br />
* `:RSmo user` would open user.rb in a horizontal split <br />
* `:RTco comments` would open comments_controller.rb in a new tab. <br />
* `:Rvi users/new.html` would open new.html, replacing whatever you have currently open.

`:A` gives you the "alternate" file for your currently open file. E.g., if you're in a model, and you type `:AV,` then the spec for that model will open up in a vertical split. Pretty nifty, right?

Ok, I hope you got all that, 'cause here's the quiz.

          },
          done_message: %q{
            Boom, son! Now you know how to get around Rails with rails.vim. Now go be amazing.
          }
         )

@level_1_commands = {
  ":Rmo users" => "Open users model",
  ":Rco users" => "Open users controller",
  ":Rvi users/index.html" => "Open view users/index.html",
  ":AV"  => "Vertical split alternate file",
  "gf" => "Go to file under cursor"
}

@level_2_commands = {
  ":RVvi home/index.html" => "Vertical split view home/index.html",
  ":RTco users" => "Open new tab with users controller",
  ":RTmo users" => "Open new tab with users model",
  ":RVco comments" => "Vertical split comments controller",
}

@level_3_commands = {
  ":Rfeature users" => "Open users feature",
  ":Rsteps users" => "Open users steps",
  ":RVsteps users" => "Vertical split users steps",
  ":RSsteps users" => "Vertical split users steps",
}

1.upto(3) do |number|
  create_commands(create_level(@lesson, number), instance_variable_get("@level_#{number}_commands"))
end
