class AddSourceUrlToQuestionsAndOptions < ActiveRecord::Migration
  def change
    add_column :questions, :source_url, :string
    add_column :options, :source_url, :string
  end
end
