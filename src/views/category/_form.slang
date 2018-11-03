- if category.errors
  ul.errors
    - category.errors.each do |error|
      li = error.to_s

== form(action: "/categories/#{category.id.to_s}", method: category.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "description", value: category.description, placeholder: "Description", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-sm")
  == link_to("back", "/categories", class: "btn btn-light btn-sm")
