class IntroPathsController < ApplicationController

  def show
    @users = User.all

    from = params[:from_id].to_i
    to = params[:to_id].to_i

    edge_list = Friendship.all.map { |f| [f.from, f.to]}

    @path = Graph.breadth_first_path(from, to, edge_list)

    @users_in_path = @path.map { |id| User.find(id) }
  end
end
