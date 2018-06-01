require 'rails_helper'


describe "User" do
  before(:each) do
      @new_user = User.create(user_name: "adamsmith", full_name:"Adam Smith Jr.", email:"adam@smith.com",password: "Targaryen")
    end

    it 'can be created' do
      expect(@new_user).to be_valid
    end

  it "has a user_name" do
    expect(User.find_by(user_name: "adamsmith")).to eq(@new_user)
  end

  it "has a full_name" do
    expect(User.find_by(full_name: "Adam Smith Jr.")).to eq(@new_user)
  end

  it "has an email address" do
    expect(User.find_by(email: "adam@smith.com")).to eq(@new_user)
  end

end
