class CreateRedcarpets < ActiveRecord::Migration
  def change
    create_table :redcarpets do |t|
      t.string :title

      t.timestamps
    end
  end
end
