require "./spec_helper"
require "../../src/models/inventory.cr"

describe Inventory do
  Spec.before_each do
    Inventory.clear
  end
end
