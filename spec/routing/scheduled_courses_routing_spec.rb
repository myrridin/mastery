require "rails_helper"

RSpec.describe ScheduledCoursesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/scheduled_courses").to route_to("scheduled_courses#index")
    end

    it "routes to #new" do
      expect(:get => "/scheduled_courses/new").to route_to("scheduled_courses#new")
    end

    it "routes to #show" do
      expect(:get => "/scheduled_courses/1").to route_to("scheduled_courses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/scheduled_courses/1/edit").to route_to("scheduled_courses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/scheduled_courses").to route_to("scheduled_courses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/scheduled_courses/1").to route_to("scheduled_courses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/scheduled_courses/1").to route_to("scheduled_courses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/scheduled_courses/1").to route_to("scheduled_courses#destroy", :id => "1")
    end

  end
end
