require "rails_helper"

RSpec.describe MeteoritesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/meteorites").to route_to("meteorites#index")
    end

    it "routes to #new" do
      expect(:get => "/meteorites/new").to route_to("meteorites#new")
    end

    it "routes to #show" do
      expect(:get => "/meteorites/1").to route_to("meteorites#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/meteorites/1/edit").to route_to("meteorites#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/meteorites").to route_to("meteorites#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/meteorites/1").to route_to("meteorites#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/meteorites/1").to route_to("meteorites#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/meteorites/1").to route_to("meteorites#destroy", :id => "1")
    end
  end
end
