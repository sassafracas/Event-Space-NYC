require 'rails_helper'


describe "Location" do
  before(:each) do
      @new_loc = Location.create(longitude: "-73.9790398", latitude:"40.7669204.", neighborhood:"Midtown")
    end

    it 'can be created' do
      expect(@new_loc).to be_valid
    end

  it "has a longitude" do
    expect(Location.find_by(longitude: "-73.9790398")).to eq(@new_loc)
  end

  it "has a latitude" do
    expect(Location.find_by(latitude: "40.7669204.")).to eq(@new_loc)
  end

  it "has an neighborhood address" do
    expect(Location.find_by(neighborhood: "Midtown")).to eq(@new_loc)
  end

end
