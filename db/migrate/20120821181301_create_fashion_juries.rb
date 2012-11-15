class CreateFashionJuries < ActiveRecord::Migration
  def change
    create_table :fashion_juries do |t|
      t.integer :score, :default => 0
      t.text :content
      t.integer :comments_count, :default => 0

      t.timestamps
    end
  end
end
