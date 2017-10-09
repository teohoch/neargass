require 'rails_helper'

RSpec.describe "locations/show", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :index => "Index",
      :show => "Show"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Index/)
    expect(rendered).to match(/Show/)
  end
end
