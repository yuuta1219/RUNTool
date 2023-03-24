class BoardsController < ApplicationController
  
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.new(board_params)

    if @board.save
      redirect_to boards_path, success: "記事を作成しました"
    else
      flash.now[:alert] = "記事作成に失敗しました"
      render :new
    end
  end

  def show; end 

  def edit; end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end
end
