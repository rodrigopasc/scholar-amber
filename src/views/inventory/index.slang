.row
  .col-sm-11
    h2 Inventories
  .col-sm-1
    a.btn.btn-success.btn-sm href="/inventories/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Description
        th Actions
    tbody
      - inventories.each do |inventory|
        tr
          td = inventory.description
          td
            span
              == link_to("read", "/inventories/#{inventory.id}", class: "btn btn-primary btn-sm")
              == link_to("edit", "/inventories/#{inventory.id}/edit", class: "btn btn-success btn-sm")
              == link_to("delete", "/inventories/#{ inventory.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
