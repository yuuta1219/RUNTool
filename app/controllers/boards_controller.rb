class BoardsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_categories_and_progresses, only: [:new, :create, :edit, :update]
  
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

  def show
    @board = Board.find(params[:id])
  end 

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to boards_path, success: "記事を編集しました"
    else
      flash.now[:alert] = "記事の編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy!
    redirect_to boards_path, success: "記事を削除しました"
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :category_id, :progress_id)
  end
  def set_categories_and_progresses
    @categories = Category.all
    @progresses = Progress.all
  end
end
