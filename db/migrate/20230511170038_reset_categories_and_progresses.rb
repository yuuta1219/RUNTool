class ResetCategoriesAndProgresses < ActiveRecord::Migration[7.0]
  def up
    Category.where(id: [5, 6, 7, 8]).delete_all
    Progress.where(id: [5, 6, 7, 8]).delete_all
  end

  def down
  end
end
