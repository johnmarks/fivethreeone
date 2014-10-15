class CreateSetTemplates < ActiveRecord::Migration
  def change
    create_table :set_templates do |t|
      t.integer :exercise_id
      t.integer :reps
      t.integer :weight
      t.string :type

      t.timestamps
    end
  end
end
