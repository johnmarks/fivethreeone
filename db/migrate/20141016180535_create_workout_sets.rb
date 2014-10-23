class CreateWorkoutSets < ActiveRecord::Migration
  def change
    create_table :workout_sets do |t|
      t.integer :workout_id
      t.integer :user_id
      t.boolean :finished, default: false
      t.integer :reps, default: 0
      t.integer :reps_completed, default: 0
      t.integer :weight, default: 45
      t.date :date

      t.timestamps
    end
  end
end
