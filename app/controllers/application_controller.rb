class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :board_search

  def board_search
    @search = Board.ransack(params[:q])
    @search_boards = @search.result
  end

end
