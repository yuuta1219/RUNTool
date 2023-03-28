class BookmarksController < ApplicationController
  
  def create
    @board = Board.find(params[:board_id])
    current_user.bookmark(@board)
    
    # turbo_stream.replaceでidがbookmark-buttonの要素を置き換える
    # turboの仕様のせいでcreate.js.erbに飛ばせないので注意
    render turbo_stream: turbo_stream.replace('bookmark-button', partial: 'bookmarks/unbookmark', locals: { board: @board })
  end

  def destroy
    @board = current_user.bookmarks.find(params[:id]).board
    current_user.unbookmark(@board)

    render turbo_stream: turbo_stream.replace('bookmark-button', partial: 'bookmarks/bookmark', locals: { board: @board })
  end
end
