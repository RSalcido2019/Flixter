class AlterLessonsAddRowOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :row_order, :integer, :section
    add_index :lessons, :row_order, :section
  end
end
