require "spec_helper"

describe InvestorProfilesController do
  describe "routing" do

    it "routes to #index" do
      get("/investor_profiles").should route_to("investor_profiles#index")
    end

    it "routes to #new" do
      get("/investor_profiles/new").should route_to("investor_profiles#new")
    end

    it "routes to #show" do
      get("/investor_profiles/1").should route_to("investor_profiles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/investor_profiles/1/edit").should route_to("investor_profiles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/investor_profiles").should route_to("investor_profiles#create")
    end

    it "routes to #update" do
      put("/investor_profiles/1").should route_to("investor_profiles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/investor_profiles/1").should route_to("investor_profiles#destroy", :id => "1")
    end

  end
end
