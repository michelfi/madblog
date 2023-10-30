class AddCategoryToSubscribers < ActiveRecord::Migration[7.0]
  def change
    add_column :subscribers, :category, :string
  end
end
