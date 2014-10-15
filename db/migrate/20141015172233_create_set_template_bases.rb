class CreateSetTemplateBases < ActiveRecord::Migration
  def change
    create_table :set_template_bases do |t|
      t.integer :exercise_id
      t.integer :reps
      t.integer :weight
      t.string :type

      t.timestamps
    end
  end
end
