require 'test_helper'


describe "Category" do

  it "has a name" do
    hot_dog = Category.create(
      name: "Unisex Adult Hot Dog Costume"
    )
    expect(Category.find_by(name: "Unisex Adult Hot Dog Costume")).to eq(hot_dog)
  end

end
