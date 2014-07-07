def create_level(lesson, number)
  Fabricate(
    :level,
    name:   "Level #{number.to_s}",
    lesson: lesson,
    sequence_number: number)
end

def create_commands(level, commands)
  commands.each do |keystroke, name|
    Fabricate(
      :command,
      level: level,
      keystroke: keystroke,
      name: name)
  end
end

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
Command.where("name like '%insert mode%'").update_all(start_mode: "Insert Mode")
