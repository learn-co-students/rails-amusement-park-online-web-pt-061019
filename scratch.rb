

<%# <%= form_for @user do |f| %>
  <%= f.hidden_field :id, :value => @user.id %>
  <%= f.submit "Log out" %>
<% end %> %>
