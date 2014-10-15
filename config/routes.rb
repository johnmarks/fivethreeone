Rails.application.routes.draw do
  resources :workouts
  resources :set_templates
  resources :five_three_one_set_templates, controller: 'set_templates', type: FiveThreeOneSetTemplate
  resources :basic_set_templates, controller: 'set_templates', type: BasicSetTemplate
  resources :exercises
  resources :programs

  root "exercises#index"
end
