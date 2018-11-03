class Inventory < Granite::Base
  adapter pg
  table_name inventories

  primary id : Int64
  field description : String
  timestamps
end
