class AddDescriptionToOptions < ActiveRecord::Migration
  def change
    add_column :options, :description, :text
  end
end
