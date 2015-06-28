require "rails_helper"

RSpec.describe OfferingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/offerings").to route_to("scheduled_courses#index")
    end

    it "routes to #new" do
      expect(:get => "/offerings/new").to route_to("scheduled_courses#new")
    end

    it "routes to #show" do
      expect(:get => "/offerings/1").to route_to("scheduled_courses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/offerings/1/edit").to route_to("scheduled_courses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/offerings").to route_to("scheduled_courses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/offerings/1").to route_to("scheduled_courses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/offerings/1").to route_to("scheduled_courses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/offerings/1").to route_to("scheduled_courses#destroy", :id => "1")
    end

  end
end
