module Graph

  def self.breadth_first_path(from_id, to_id, edge_list)
    return [] if edge_list.empty?
    adjacency_list = self.edge_to_adjacency_list(edge_list)
    # find short path

    # check array of nodes for from_id to see if it contains the to_id
    # if it does, return the path
    # if not, check the first node in the from_id's array to see if their array contains the to_id

    # clues
      # maintain a queue
      # queue of paths
      # first item in the path includes the from_id ex: [1]
      # then de-queue, add neighbors to path (if it satisfies to_id, return path, if not, de-queue and keep going through while loop)
      # need a visited queue as well so you don't iterate over the same numbers
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
