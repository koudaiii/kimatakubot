require "spec_helper"

describe PaydaysController do
  describe "routing" do

    it "routes to #index" do
      get("/paydays").should route_to("paydays#index")
    end

    it "routes to #new" do
      get("/paydays/new").should route_to("paydays#new")
    end

    it "routes to #show" do
      get("/paydays/1").should route_to("paydays#show", :id => "1")
    end

    it "routes to #edit" do
      get("/paydays/1/edit").should route_to("paydays#edit", :id => "1")
    end

    it "routes to #create" do
      post("/paydays").should route_to("paydays#create")
    end

    it "routes to #update" do
      put("/paydays/1").should route_to("paydays#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/paydays/1").should route_to("paydays#destroy", :id => "1")
    end

  end
end
