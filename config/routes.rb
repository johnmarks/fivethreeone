Rails.application.routes.draw do
  devise_for :users
  
  resources :set_templates,:workouts, :exercises, :programs, :workout_sets, :exercise_datas
  resources :five_three_one_set_templates, controller: 'set_templates', type: FiveThreeOneSetTemplate
  resources :basic_set_templates, controller: 'set_templates', type: BasicSetTemplate
  
  get 'settings', to: "users#settings", as: :settings
  post 'settings', to: "users#update_settings", as: :update_settings
  root "workout_sets#index"
end
