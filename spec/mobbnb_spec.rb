require './lib/mobbnb'

describe Mobbnb do
  subject(:mobbnb) {Mobbnb.new}
  describe "#add_email" do
    it "allows user to add email" do
      mobbnb.add_email("mobtheworld@mob.com")
      expect(mobbnb.email).to eq("mobtheworld@mob.com")
    end
  end

  describe "#add_password" do
    it "allows user to add password" do
      mobbnb.add_password("hello1")
      expect(mobbnb.password).to eq("hello1")
    end
  end
end