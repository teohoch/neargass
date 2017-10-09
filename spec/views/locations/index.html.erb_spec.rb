require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        :index => "Index",
        :show => "Show"
      ),
      Location.create!(
        :index => "Index",
        :show => "Show"
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", :text => "Index".to_s, :count => 2
    assert_select "tr>td", :text => "Show".to_s, :count => 2
  end
end
