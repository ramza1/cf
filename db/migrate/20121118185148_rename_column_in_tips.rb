class RenameColumnInTips < ActiveRecord::Migration
  def change
    change_column :tips, :body, :text
  end
end
