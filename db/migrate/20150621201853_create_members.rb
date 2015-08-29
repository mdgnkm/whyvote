class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.belongs_to :user, index: true
      t.belongs_to :team, index: true
      t.boolean :captain, default: false, null: false
      t.timestamps null: false
    end
  end
end
