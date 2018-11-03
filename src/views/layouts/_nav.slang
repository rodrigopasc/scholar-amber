- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/categories" ? "active" : ""
a class="nav-item #{active}" href="/categories" Categories
- active = context.request.path == "/posts" ? "active" : ""
a class="nav-item #{active}" href="/posts" Posts
- if (current_user = context.current_user)
  a.nav-item.nav-item-auth.nav-item-auth-signout href="/signout"
    | Sign Out
  - active = context.request.path == "/profile" ? "active" : ""
  a class="nav-item nav-item-auth nav-item-auth-profile #{active}" href="/profile"
    == current_user.email
- else
  - active = context.request.path == "/signup" ? "active" : ""
  a class="nav-item nav-item-auth nav-item-auth-signup #{active}" href="/signup"
    | Sign Up
  - active = context.request.path == "/signin" ? "active" : ""
  a class="nav-item nav-item-auth nav-item-auth-signin #{active}" href="/signin"
    | Sign In
- active = context.request.path == "/inventories" ? "active" : ""
a class="nav-item #{active}" href="/inventories" Inventories
