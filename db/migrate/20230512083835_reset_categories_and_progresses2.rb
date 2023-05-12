class ResetCategoriesAndProgresses2 < ActiveRecord::Migration[7.0]
  def up
    Category.where(id: [9, 10, 11, 12]).delete_all
    Progress.where(id: [9, 10, 11, 12]).delete_all
  end

  def down
  end
end
