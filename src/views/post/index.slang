.row
  .col-sm-11
    h2 Posts
  .col-sm-1
    a.btn.btn-success.btn-sm href="/posts/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Category
        th Title
        th Content
        th Actions
    tbody
      - posts.each do |post|
        tr
          td = post.category.id
          td = post.title
          td = post.content
          td
            span
              == link_to("read", "/posts/#{post.id}", class: "btn btn-primary btn-sm")
              == link_to("edit", "/posts/#{post.id}/edit", class: "btn btn-success btn-sm")
              == link_to("delete", "/posts/#{ post.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
