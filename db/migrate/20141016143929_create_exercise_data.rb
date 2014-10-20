class CreateExerciseData < ActiveRecord::Migration
  def change
    create_table :exercise_data do |t|
      t.integer :exercise_id
      t.integer :one_rep_max
      t.integer :working_one_rep_max
      t.integer :lifts_without_increase
      t.integer :personal_record
      t.integer :user_id

      t.timestamps
    end
  end
end
