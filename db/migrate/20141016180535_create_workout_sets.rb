class CreateWorkoutSets < ActiveRecord::Migration
  def change
    create_table :workout_sets do |t|
      t.integer :workout_id
      t.integer :user_id
      t.boolean :finished
      t.integer :reps
      t.integer :weight

      t.timestamps
    end
  end
end
