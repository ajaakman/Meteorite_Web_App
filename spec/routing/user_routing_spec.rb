require "rails_helper"

RSpec.describe HomeController, type: :routing do
  describe "routing" do
    it "routes to #root" do
      expect(:get => "/").to route_to("home#home")
    end

    it "routes to #home" do
      expect(:get => "/home/home").to route_to("home#home")
    end

    it "routes to #about" do
      expect(:get => "/home/about").to route_to("home#about")
    end

  end
end
