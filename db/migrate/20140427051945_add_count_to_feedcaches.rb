class AddCountToFeedcaches < ActiveRecord::Migration
  def change
    add_column :feedcaches, :count, :integer
  end
end
