require "spec_helper"

describe MastercakesController do
  describe "routing" do

    it "routes to #index" do
      get("/mastercakes").should route_to("mastercakes#index")
    end

    it "routes to #new" do
      get("/mastercakes/new").should route_to("mastercakes#new")
    end

    it "routes to #show" do
      get("/mastercakes/1").should route_to("mastercakes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mastercakes/1/edit").should route_to("mastercakes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mastercakes").should route_to("mastercakes#create")
    end

    it "routes to #update" do
      put("/mastercakes/1").should route_to("mastercakes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mastercakes/1").should route_to("mastercakes#destroy", :id => "1")
    end

  end
end
