class AddQuoteOwnerToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :quote_owner, :string
  end
end
