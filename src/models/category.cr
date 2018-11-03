class Category < Granite::Base
  adapter pg
  table_name categories

  primary id : Int64
  field description : String
  timestamps
end
