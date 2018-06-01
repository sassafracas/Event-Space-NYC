require 'rails_helper'


describe "Event" do
  before(:each) do
      @new_category = Category.create(name: "Art")
      @new_location = Location.create(longitude: "-73.9790398", latitude:"40.7669204.", neighborhood:"Midtown")
      @new_event = Event.create(title: "Live Painting", description:"Just Art", location:@new_location, category:@new_category)
    end

    it 'can be created' do
      expect(@new_event).to be_valid
    end

  it "has a title" do
    expect(Event.find_by(title: "Live Painting")).to eq(@new_event)
  end

  it "has a description" do
    expect(Event.find_by(description: "Just Art")).to eq(@new_event)
  end

  it "has a location" do
    expect(Event.find_by(location: @new_location)).to eq(@new_event)
  end

  it "has a category" do
    expect(Event.find_by(category: @new_category)).to eq(@new_event)
  end

end
