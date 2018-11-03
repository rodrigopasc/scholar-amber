- if post.errors
  ul.errors
    - post.errors.each do |error|
      li = error.to_s

== form(action: "/posts/#{post.id.to_s}", method: post.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == label(:category)
    == select_field(name: "category_id", collection: Category.all.map{|category| [category.id, category.id]}, selected: post.category_id, class: "form-control")
  .form-group
    == text_field(name: "title", value: post.title, placeholder: "Title", class: "form-control")
  .form-group
    == text_area(name: "content", content: post.content, placeholder: "Content", class: "form-control", size: "30x10")
  == submit("Submit", class: "btn btn-primary btn-sm")
  == link_to("back", "/posts", class: "btn btn-light btn-sm")
