h1 Show Category
p = category.description
p
  == link_to("back", "/categories", class: "btn btn-light btn-sm")
  == link_to("edit", "/categories/#{category.id}/edit", class: "btn btn-success btn-sm")
  == link_to("delete", "/categories/#{category.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
