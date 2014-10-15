class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :program_id
      t.integer :day
      t.integer :set_template_base_id

      t.timestamps
    end
  end
end
