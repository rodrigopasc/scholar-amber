- if inventory.errors
  ul.errors
    - inventory.errors.each do |error|
      li = error.to_s

== form(action: "/inventories/#{inventory.id.to_s}", method: inventory.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "description", value: inventory.description, placeholder: "Description", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-sm")
  == link_to("back", "/inventories", class: "btn btn-light btn-sm")
