require 'pry'

module Graph

  def self.breadth_first_path(from_id, to_id, edge_list, exclude = [])
    return [] if edge_list.empty?
    adjacency_list = self.edge_to_adjacency_list(edge_list)

    queue = [from_id]
    visited = {from_id => nil}

    until queue.empty?
      node = queue.shift

      for neighbor in adjacency_list[node]
        next if visited.has_key?(neighbor)
        next if exclude.include?(neighbor)

        visited[neighbor] = node

        if neighbor == to_id
          queue = []
          break
        else
          queue.push(neighbor)
        end
      end
    end

    return [] if !visited.has_key?(to_id)
    Graph.path_to(visited, to_id)
  end

  def self.breadth_first_paths(from_id, to_id, edge_list)
    queue = []
    excludes = []
    paths = []

    loop do
      path = Graph.breadth_first_path(from_id, to_id, edge_list, excludes)
      break if path.empty?
      paths.push(path)
      queue += path[1...-1]
      queue.uniq!
      excludes.push(queue.shift)
      break if queue.empty?
    end

    paths
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
