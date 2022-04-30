require "rails_helper"

RSpec.describe OrderedMedicinesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ordered_medicines").to route_to("ordered_medicines#index")
    end

    it "routes to #new" do
      expect(get: "/ordered_medicines/new").to route_to("ordered_medicines#new")
    end

    it "routes to #show" do
      expect(get: "/ordered_medicines/1").to route_to("ordered_medicines#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/ordered_medicines/1/edit").to route_to("ordered_medicines#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/ordered_medicines").to route_to("ordered_medicines#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/ordered_medicines/1").to route_to("ordered_medicines#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/ordered_medicines/1").to route_to("ordered_medicines#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/ordered_medicines/1").to route_to("ordered_medicines#destroy", id: "1")
    end
  end
end
