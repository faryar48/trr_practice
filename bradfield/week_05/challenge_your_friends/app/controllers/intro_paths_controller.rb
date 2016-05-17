class IntroPathsController < ApplicationController

  def show
    @users = User.all

    @from = params[:from_id].try(:to_i) || @users.first.id
    @to = params[:to_id].try(:to_i) || @users.second.id

    edge_list = Friendship.all.map { |f| [f.from, f.to]}

    @paths = Graph.breadth_first_paths(@from, @to, edge_list).map { |path| path.map { |id| User.find(id) } }
  end
end
