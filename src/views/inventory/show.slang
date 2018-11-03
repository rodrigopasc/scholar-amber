h1 Show Inventory
p = inventory.description
p
  == link_to("back", "/inventories", class: "btn btn-light btn-sm")
  == link_to("edit", "/inventories/#{inventory.id}/edit", class: "btn btn-success btn-sm")
  == link_to("delete", "/inventories/#{inventory.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
