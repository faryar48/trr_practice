require 'pry'

module Graph

  def self.breadth_first_path(from_id, to_id, edge_list)
    return [] if edge_list.empty?
    adjacency_list = self.edge_to_adjacency_list(edge_list)

    queue = [from_id]
    visited = {from_id => nil}

    while !queue.empty?
      new_node = queue.shift
      neighbors = adjacency_list[new_node]

      for neighbor in neighbors
        next if visited.has_key?(neighbor)

        visited[neighbor] = new_node

        if neighbor == to_id
          queue = []
          break
        else
          queue.push(neighbor) if !queue.include?(neighbor)
        end
      end
    end


    return [] if !visited.has_key?(to_id)
    Graph.path_to(visited, to_id)
  end

  def self.path_to(visited, to_id)
    path = [to_id]
    while visited[to_id]
      previous = visited[to_id]
      path.unshift(previous)
      to_id = previous
    end
    path
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
