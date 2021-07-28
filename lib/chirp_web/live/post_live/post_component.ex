defmodule ChirpWeb.PostLive.PostComponent do
  use ChirpWeb, :live_component

  def render(assigns) do
    ~L"""
    <div id="post-<%= @post.id %>" class="post">
      <div class="row">
        <div class="column column-10">
          <div class="post-avatar"></div>
        </div>
        <div class="column column-90 post-body">
          <b>@<%= @post.username %></b>
          <br/>
          <%= @post.body %>
        </div>
      </div>

      <div class="row">
        <div class="column">
          likes <%= @post.likes_count %>
        </div>
        <div class="column">
          reposts <%= @post.reposts_count %>
        </div>
        <div class="column">
          <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id) do %>
            Edit
          <% end %>
          <%= link to: "#", phx_click: "delete", phx_value_id: @post.id do %>
            Delete
          <% end %>
        </div>
      </div>
    </div>
    """
  end
end
