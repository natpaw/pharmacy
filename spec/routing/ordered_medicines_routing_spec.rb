require "rails_helper"

RSpec.describe OrderedMedicinesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/orders/1/ordered_medicines").to route_to("ordered_medicines#index", :order_id => "1")
    end

    it "routes to #new" do
      expect(get: "/orders/1/ordered_medicines/new").to route_to("ordered_medicines#new", :order_id => "1")
    end

    it "routes to #show" do
      expect(get: "/orders/1/ordered_medicines/1").to route_to("ordered_medicines#show", id: "1", :order_id => "1")
    end

    it "routes to #edit" do
      expect(get: "/orders/1/ordered_medicines/1/edit").to route_to("ordered_medicines#edit", id: "1", :order_id => "1")
    end


    it "routes to #create" do
      expect(post: "/orders/1/ordered_medicines").to route_to("ordered_medicines#create", :order_id => "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/orders/1/ordered_medicines/1").to route_to("ordered_medicines#update", id: "1", :order_id => "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/orders/1/ordered_medicines/1").to route_to("ordered_medicines#update", id: "1", :order_id => "1")
    end

    it "routes to #destroy" do
      expect(delete: "/orders/1/ordered_medicines/1").to route_to("ordered_medicines#destroy", id: "1", :order_id => "1")
    end
  end
end
