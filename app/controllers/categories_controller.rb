class CategoriesController < ApplicationController
  skip_before_action :require_login, only: %i[show]
  def show
    @category = Category.find(params[:id])
    @boards = Board.where(category_id: @category.id)
  end
end
