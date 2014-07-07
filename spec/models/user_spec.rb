require 'spec_helper'

describe User do

  let(:user) { User.create_temporary }

  describe '.create_temporary' do
    it "returns a temporary user" do
      expect(user).to be_instance_of User
      expect(user.temporary).to be_true
    end
  end

  describe '#save_command' do

    let(:command) { Fabricate(:command) }

    it "creates a join table record between user and command" do
      user.save_command(command)
      expect(user.commands.count).to eq 1
    end

  end

  describe '#mastered_commands_for_level' do

    let(:level) { Fabricate(:level) }
    let(:command) { Fabricate(:command, level: level) }
    subject { user.mastered_commands_for_level(level) }

    it "returns an empty relation for a user with no commands" do
      expect(subject).to be_empty
    end

    it "returns an empty relation if no command is mastered" do
      count = Command::MASTERY_NUMBER - 1
      count.times { user.save_command(command) }
      expect(subject).to be_empty
  end

    it "returns a command that a user has more than mastery_number times" do
      Command::MASTERY_NUMBER.times { user.save_command(command) }
      expect(subject.first).to eq command
    end

  end

  describe "#commands_remaining_for_level" do

    let(:level) { Fabricate(:level) }
    let(:mastered_command) { Fabricate(:command, name: "Mastered", level: level) }
    let!(:unmastered_command) { Fabricate(:command, name: "Unmastered", level: level) }
    subject { user.commands_remaining_for_level(level) }

    it "returns the command that hasn't been mastered" do
      Command::MASTERY_NUMBER.times { user.save_command(mastered_command) }
      expect(subject.first).to eq unmastered_command
    end

  end

end
