require 'spec_helper'

describe ApplicationHelper do

  let(:commands) { ["w","x","y","z"] }

  describe '#left_half' do
    it "returns the left half of an array" do
      expect(left_half(commands)).to eq ["w","x"]
    end
  end

  describe '#right_half' do
    it "returns the right half of an array" do
      expect(right_half(commands)).to eq ["y","z"]
    end
  end

end
