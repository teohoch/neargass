require 'rails_helper'

RSpec.describe "locations/show", type: :view do
=begin
 # =begin
 # /*location index hacer tres:
 # responda en json
 # javascrip (muy complicada, después verlo)
 # htlml*/
 # =end
=end
  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Index/)
    expect(rendered).to match(/Show/)
  end
end
