require 'spec_helper'

describe User do
  subject (:user) do
    User.new(
      name: "Adam",
      email: "adam.gilg@example.com",
      password: "12345"
      )
  end

  it "is not valid with a bad email address" do
    user.email = "adam@adam"
    user.should_not be_valid
  end

  it "is not valid without a name" do
    user.name = nil
    user.should_not be_valid
  end

  it "is valid with correct name and email" do
    user.should be_valid
  end

end
