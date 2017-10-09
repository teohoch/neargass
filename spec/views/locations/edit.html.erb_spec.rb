require 'rails_helper'

RSpec.describe "locations/edit", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :index => "MyString",
      :show => "MyString"
    ))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(@location), "post" do

      assert_select "input[name=?]", "location[index]"

      assert_select "input[name=?]", "location[show]"
    end
  end
end
