class User < ActiveRecord::Base
  def self.breadth_first_paths(from_id, to_id, edge_list)
    adjacency_list = self.edge_to_adjacency_list(edge_list)
  end

  def self.edge_to_adjacency_list(edge_list)
    edge_list.reduce({}) do |adj_list, (a, b)|
      adj_list[a] = [] unless adj_list[a]
      adj_list[a].push(b)

      adj_list[b] = [] unless adj_list[b]
      adj_list[b].push(a)

      adj_list
    end
  end
end
