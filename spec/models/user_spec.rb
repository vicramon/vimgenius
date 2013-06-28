require 'spec_helper'

describe User do

  let(:user) { User.create_temporary }
  let(:command) { Fabricate(:command) }

  describe '.create_temporary' do
    it "returns a temporary user" do
      expect(user).to be_instance_of User
      expect(user.temporary).to be_true
    end
  end

  describe '#mastered' do

    subject { user.mastered?(command) }

    context "a user has no commands" do
      it "returns false" do
        expect(subject).to be_false
      end
    end

    context "a user has one command" do
      it "returns false" do
        user.commands << command
        expect(subject).to be_false
      end
    end

    context "a user enough commands to be a master" do
      it "returns true" do
        (Command::MASTERY_NUMBER).times do
          user.commands << command
        end
        expect(subject).to be_true
      end
    end

  end

  describe '.mastered_commands' do

    subject { user.mastered_commands }

    context "a user has no commands" do
      it "should be false" do
        expect(subject).to eq nil
      end
    end

    context "a user has mastered commands" do
      it "should be false" do
        (Command::MASTERY_NUMBER).times do
          user.commands << command
        end
        expect(subject).to eq [command]
      end
    end

  end


end
