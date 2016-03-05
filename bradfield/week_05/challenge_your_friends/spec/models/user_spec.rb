require 'rails_helper'

RSpec.describe User, type: :model do

  describe ".edge_to_adjacency_list" do


    describe "should return an adjacency list" do
      it "should return an empty hash if adjacency list is empty" do
        given = []
        expected = {}

        expect(User.edge_to_adjacency_list(given)).to eq(expected)
      end

      it "should be bidirectional (simple)" do
        given = [[1, 2]]
        expected = {1 => [2], 2 => [1]}

        expect(User.edge_to_adjacency_list(given)).to eq(expected)
      end

      it "should be bidirectional (more complex)" do
        given = [[1, 2], [1, 3]]
        expected = {1 => [2, 3], 2 => [1], 3 => [1]}

        expect(User.edge_to_adjacency_list(given)).to eq(expected)
      end
    end
  end
end
