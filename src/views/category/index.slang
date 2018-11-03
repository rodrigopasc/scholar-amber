.row
  .col-sm-11
    h2 Categories
  .col-sm-1
    a.btn.btn-success.btn-sm href="/categories/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Description
        th Actions
    tbody
      - categories.each do |category|
        tr
          td = category.description
          td
            span
              == link_to("read", "/categories/#{category.id}", class: "btn btn-primary btn-sm")
              == link_to("edit", "/categories/#{category.id}/edit", class: "btn btn-success btn-sm")
              == link_to("delete", "/categories/#{ category.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
