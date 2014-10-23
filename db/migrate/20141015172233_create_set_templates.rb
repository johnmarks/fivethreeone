class CreateSetTemplates < ActiveRecord::Migration
  def change
    create_table :set_templates do |t|
      t.integer :exercise_id
      t.integer :reps, default: 5
      t.integer :weight, default: 45
      t.boolean :max_reps, default: false
      t.string :type

      t.timestamps
    end
  end
end
