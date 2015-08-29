class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|
      t.string :name
      t.timestamps
    end

    create_table :options_parties, :id => false do |t|
      t.integer :option_id, :index => true
      t.integer :party_id, :index => true
    end
  end

  def self.down
    drop_table :parties
    drop_table :options_parties
  end
end
