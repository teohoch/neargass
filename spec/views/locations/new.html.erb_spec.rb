require 'rails_helper'

RSpec.describe "locations/new", type: :view do
  before(:each) do
    assign(:location, Location.new(
      :index => "MyString",
      :show => "MyString"
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input[name=?]", "location[index]"

      assert_select "input[name=?]", "location[show]"
    end
  end
end
