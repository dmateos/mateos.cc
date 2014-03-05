class CreateFeedcaches < ActiveRecord::Migration
  def change
    create_table :feedcaches do |t|
      t.string :for

      t.string :title
      t.text :data
      t.timestamps
    end
  end
end
