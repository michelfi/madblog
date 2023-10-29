class DropComments < ActiveRecord::Migration[7.0]
  def up
    drop_table :comments
  end

  def down
    create_table :comments do |t|
      t.string :content
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
