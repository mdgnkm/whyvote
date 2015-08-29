class AddEducationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :school, :string
    add_column :users, :degree, :string
    add_column :users, :description, :text
    add_column :users, :graduation_date, :string
  end
end
