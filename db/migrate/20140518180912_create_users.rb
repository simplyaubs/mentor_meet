class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :category
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :expertise
    end
  end
end
