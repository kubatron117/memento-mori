require "rails_helper"

RSpec.describe LifeExpectanciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/life_expectancies").to route_to("life_expectancies#index")
    end

    it "routes to #show" do
      expect(get: "/life_expectancies/1").to route_to("life_expectancies#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/life_expectancies").to route_to("life_expectancies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/life_expectancies/1").to route_to("life_expectancies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/life_expectancies/1").to route_to("life_expectancies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/life_expectancies/1").to route_to("life_expectancies#destroy", id: "1")
    end
  end
end
