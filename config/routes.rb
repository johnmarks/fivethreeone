Rails.application.routes.draw do
  devise_for :users
  
  resources :set_templates,:workouts, :exercises, :programs, :workout_sets, :exercise_datas
  resources :five_three_one_set_templates, controller: 'set_templates', type: FiveThreeOneSetTemplate
  resources :basic_set_templates, controller: 'set_templates', type: BasicSetTemplate
  
  get 'setup_complete', to: "users#setup_complete", as: :setup_complete
  root "workout_sets#index"
end
