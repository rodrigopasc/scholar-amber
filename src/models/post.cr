class Post < Granite::Base
  adapter pg
  table_name posts

  belongs_to :category

  primary id : Int64
  field title : String
  field content : String
  timestamps
end
