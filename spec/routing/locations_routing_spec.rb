require "rails_helper"

RSpec.describe LocationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/locations").to route_to("locations#index")
    end

    it "routes to #show" do
      expect(:get => "/locations/1").to route_to("locations#show", :id => "1")
    end
  end
end
