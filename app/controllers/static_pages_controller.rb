class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top terms policy]

  def top
    @boards = Board.all
  end

  def terms; end

  def policy; end

end
