class CreateSurveys < ActiveRecord::Migration
  def self.up
    create_table :surveys do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :questions do |t|
      t.integer :survey_id
      t.string :text
      t.text :description
      t.timestamps
    end

    create_table :options do |t|
      t.integer :question_id
      t.integer :weight, default: 0
      t.string :text
      t.integer :political_party
      t.timestamps
    end

    create_table :attempts do |t|
      t.belongs_to :participant
      t.integer :survey_id
      t.integer :party_result
      t.timestamps
    end

    create_table :answers do |t|
      t.integer :attempt_id
      t.integer :question_id
      t.integer :option_id
      t.timestamps
    end
  end

  def self.down
    drop_table :surveys
    drop_table :questions
    drop_table :options
    drop_table :attempts
    drop_table :answers
  end
end
