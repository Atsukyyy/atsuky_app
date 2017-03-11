class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :content
      t.references :topic, index: true

      t.timestamps
    end
    add_index :posts, [:topic_id, :created_at]
  end
end
