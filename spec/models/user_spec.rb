require 'spec_helper'

describe User do

  describe '.create_temporary' do
    let(:user) { User.create_temporary }
    it "returns a temporary user" do
      expect(user).to be_instance_of User
      expect(user.temporary).to be_true
    end
  end


end
