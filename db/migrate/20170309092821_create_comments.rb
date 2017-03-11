class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :content
      t.integer :post_id
      #t.references :post, index: true

      t.timestamps
    end
    add_index :comments, [:post_id, :created_at]
  end
end
