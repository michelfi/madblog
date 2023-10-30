class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :subscriber, null: false, foreign_key: true
      t.references :newsletter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
