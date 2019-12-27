

<%# <%= form_for @user do |f| %>
  <%= f.hidden_field :id, :value => @user.id %>
  <%= f.submit "Log out" %>
<% end %> %>


sign in

<%= form_for @user, url:"/sessions", method: :post do |f| %>
  <%= f.label :name %>
  <%= collection_select(:user, :name, User.all, :name, :name, prompt: "Please select your username from this dropdown") %><br><br>
  <%= f.label :password %><br>
  <%= f.password_field :password, :html=> {:id => 'password'}%>
  <%= f.submit "Sign In" %>

<% end %>
