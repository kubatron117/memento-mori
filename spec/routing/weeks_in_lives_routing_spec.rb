require "rails_helper"

RSpec.describe WeeksInLivesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/weeks_in_lives").to route_to("weeks_in_lives#index")
    end

    it "routes to #show" do
      expect(get: "/weeks_in_lives/1").to route_to("weeks_in_lives#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/weeks_in_lives").to route_to("weeks_in_lives#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/weeks_in_lives/1").to route_to("weeks_in_lives#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/weeks_in_lives/1").to route_to("weeks_in_lives#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/weeks_in_lives/1").to route_to("weeks_in_lives#destroy", id: "1")
    end
  end
end
