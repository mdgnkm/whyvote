class RemovePoliticalPartyAndWeightInOptions < ActiveRecord::Migration
  def change
    remove_column :options, :political_party, :integer
    remove_column :options, :weight, :integer
  end
end
