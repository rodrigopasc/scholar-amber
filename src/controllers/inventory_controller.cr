class InventoryController < ApplicationController
  getter inventory = Inventory.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_inventory }
  end

  def index
    inventories = Inventory.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    inventory = Inventory.new inventory_params.validate!
    if inventory.save
      redirect_to action: :index, flash: {"success" => "Created inventory successfully."}
    else
      flash["danger"] = "Could not create Inventory!"
      render "new.slang"
    end
  end

  def update
    inventory.set_attributes inventory_params.validate!
    if inventory.save
      redirect_to action: :index, flash: {"success" => "Updated inventory successfully."}
    else
      flash["danger"] = "Could not update Inventory!"
      render "edit.slang"
    end
  end

  def destroy
    inventory.destroy
    redirect_to action: :index, flash: {"success" => "Deleted inventory successfully."}
  end

  private def inventory_params
    params.validation do
      required :description { |f| !f.nil? }
    end
  end

  private def set_inventory
    @inventory = Inventory.find! params[:id]
  end
end
