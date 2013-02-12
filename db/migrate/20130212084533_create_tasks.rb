class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.datetime :due_date
      t.string :title
      t.belongs_to :assign_to
      t.text :description

      t.timestamps
    end
    add_index :tasks, :assign_to_id
  end
end
