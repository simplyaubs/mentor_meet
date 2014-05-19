class RemoveCategoryAndExpertiseFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :category, :string
    remove_column :users, :expertise, :string
  end
end
