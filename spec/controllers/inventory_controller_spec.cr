require "./spec_helper"

def inventory_hash
  {"description" => "Fake"}
end

def inventory_params
  params = [] of String
  params << "description=#{inventory_hash["description"]}"
  params.join("&")
end

def create_inventory
  model = Inventory.new(inventory_hash)
  model.save
  model
end

class InventoryControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe InventoryControllerTest do
  subject = InventoryControllerTest.new

  it "renders inventory index template" do
    Inventory.clear
    response = subject.get "/inventories"

    response.status_code.should eq(200)
    response.body.should contain("inventories")
  end

  it "renders inventory show template" do
    Inventory.clear
    model = create_inventory
    location = "/inventories/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Inventory")
  end

  it "renders inventory new template" do
    Inventory.clear
    location = "/inventories/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Inventory")
  end

  it "renders inventory edit template" do
    Inventory.clear
    model = create_inventory
    location = "/inventories/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Inventory")
  end

  it "creates a inventory" do
    Inventory.clear
    response = subject.post "/inventories", body: inventory_params

    response.headers["Location"].should eq "/inventories"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a inventory" do
    Inventory.clear
    model = create_inventory
    response = subject.patch "/inventories/#{model.id}", body: inventory_params

    response.headers["Location"].should eq "/inventories"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a inventory" do
    Inventory.clear
    model = create_inventory
    response = subject.delete "/inventories/#{model.id}"

    response.headers["Location"].should eq "/inventories"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
