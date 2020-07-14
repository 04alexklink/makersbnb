require './lib/user'

describe User do
  subject(:user) {User.new}
  describe "#add_email" do
    it "allows user to add email" do
      subject.add_email("mobtheworld@mob.com")
      expect(subject.email).to eq("mobtheworld@mob.com")
    end
  end
  describe "#add_password" do
    it "allows user to add pw" do
      subject.add_password("hello1")
      expect(subject.password).to eq("hello1")
    end
  end

end

