require "rails_helper"

RSpec.describe PharmacistsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/pharmacists").to route_to("pharmacists#index")
    end

    it "routes to #new" do
      expect(get: "/pharmacists/new").to route_to("pharmacists#new")
    end

    it "routes to #show" do
      expect(get: "/pharmacists/1").to route_to("pharmacists#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/pharmacists/1/edit").to route_to("pharmacists#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/pharmacists").to route_to("pharmacists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/pharmacists/1").to route_to("pharmacists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/pharmacists/1").to route_to("pharmacists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/pharmacists/1").to route_to("pharmacists#destroy", id: "1")
    end
  end
end
