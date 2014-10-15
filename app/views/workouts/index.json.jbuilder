json.array!(@workouts) do |workout|
  json.extract! workout, :id, :program_id, :day, :set_template_base_id
  json.url workout_url(workout, format: :json)
end
