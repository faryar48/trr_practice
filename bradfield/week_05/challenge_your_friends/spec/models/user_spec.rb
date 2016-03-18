require 'rails_helper'

RSpec.describe Graph, type: :model do

  describe ".edge_to_adjacency_list" do
    it "should return an empty hash if adjacency list is empty" do
      given = []
      expected = {}

      expect(Graph.edge_to_adjacency_list(given)).to eq(expected)
    end

    it "should be bidirectional (simple)" do
      given = [[1, 2]]
      expected = {1 => [2], 2 => [1]}

      expect(Graph.edge_to_adjacency_list(given)).to eq(expected)
    end

    it "should be bidirectional (more complex)" do
      given = [[1, 2], [1, 3]]
      expected = {1 => [2, 3], 2 => [1], 3 => [1]}

      expect(Graph.edge_to_adjacency_list(given)).to eq(expected)
    end
  end

  describe ".breadth_first_path" do
    describe "with empty edge list" do
      it "should return no path" do
        given_edge_list = []
        given_from = 1
        given_to = 2
        expected = []
        expect(Graph.breadth_first_path(given_from, given_to, given_edge_list)).to eq(expected)
      end
    end

    describe "with simple edge list" do
      it "should return short path" do
        given_edge_list = [[1, 2]]
        given_from = 1
        given_to = 2
        expected = [1, 2]
        expect(Graph.breadth_first_path(given_from, given_to, given_edge_list)).to eq(expected)
      end
    end

    describe "with more complex edge list" do
      it "should return a longer path" do
        given_edge_list = [
          [:a, :b],
          [:a, :c],
          [:b, :c],
          [:c, :d],
          [:c, :e],
          [:e, :f]]
          given_from = :a
          given_to = :f
          expected = [:a, :c, :e, :f]

          expect(Graph.breadth_first_path(given_from, given_to, given_edge_list)).to eq(expected)
      end

      it "should return a longer path" do
        given_edge_list = [
          [:a, :b],
          [:a, :c],
          [:b, :c],
          [:c, :d],
          [:e, :f]]
          given_from = :a
          given_to = :f
          expected = []

          expect(Graph.breadth_first_path(given_from, given_to, given_edge_list)).to eq(expected)
      end
    end
  end
end

















