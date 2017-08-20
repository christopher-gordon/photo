require "spec_helper"

describe Volume do
  context "valid?" do
    it { should have_many(:posts) }
    it { should validate_presence_of(:name) }
  end
end
