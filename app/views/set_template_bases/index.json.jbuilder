json.array!(@set_template_bases) do |set_template_basis|
  json.extract! set_template_basis, :id, :exercise_id, :reps, :weight, :type
  json.url set_template_basis_url(set_template_basis, format: :json)
end
