json.array!(@set_templates) do |set_template|
  json.extract! set_template, :id, :exercise_id, :reps, :weight, :type
  json.url set_template_url(set_template, format: :json)
end
