SampleApp::Application.routes.draw do

  get "email/remind"

  post "email/remind"

  resources :candidates do
    member do
      get :following, :followers, :change, :index
      post :change
    end
    collection do
      get 'search'
    end

  end

  resources :pages do
    collection do
      get 'search'
    end
  end

  resources :candidates do
    resources :candidate_certifications
  end
  
  resources :sessions,   :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy]
  resources :followings, :only => [:create, :destroy]
  resources :resume
  resources :candidate_prof_summaries do
    collection do
      get 'destroy'
      post 'destroy'
    end
  end

  resources :candidate_certifications do
    collection do
      get 'destroy'
      post 'destroy'
    end
  end

  match '/signup',  :to => 'candidates#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/home',    :to => 'pages#home'

  match "/candidates/:id/resume" => 'resume#index'
  match "/candidates/:id/resume/summary" => 'resume#summary'
  match "/candidates/:id/resume/experience" => 'resume#experience'
  match "/candidates/:id/resume/experience/new" => 'experiences#new'
  match "/candidates/:id/resume/experience/:experience_id/skills/new" => 'experiences#skill'
  match "/experiences/:id/destroy" => 'experiences#destroy'
  match "/candidates/:id/resume/experience/:experience_id/details/new" => 'experience_details#new'
  #match "/resume_details/:id/destro" => 'resume_details#destro'
  match "/candidate_prof_summaries/destro" => 'candidate_prof_summaries#destro'
  #match "/resume_details/:id/destroy" => resume_details_destroy_path
#  match "/candidates/:id/resume/education" => 'resume#education'
#  match "/education/destroy" => 'educations#destroy'
  # Projects
  match "/candidates/:id/projects" => 'projects#index'
  match "/candidates/:id/projects/new" => 'projects#new'
  match "/candidates/:id/project/:project_id/update" => 'projects#update'
  match "/candidates/:id/project/:project_id/show" => 'projects#show'
  match "/candidates/:id/project/:project_id/destroy" => 'projects#destroy'
  ## Project Roles
  match "/candidates/:id/projects/:project_id/projroles/new" => 'projroles#new'
  match "/candidates/:id/project/:project_id/projrole/:projrole_id/update" => 'projroles#update'
  match "/candidates/:id/project/:project_id/projrole/:projrole_id/show" => 'projroles#show'
  match "/candidates/:id/project/:project_id/projrole/:projrole_id/destroy" => 'projroles#destroy'
  ## Project Responsibilities
  match "/candidates/:id/projects/:project_id/projroles/:projrole_id/roles_responsibilities/new" => 'roles_responsibilities#new'
  match "/candidates/:id/project/:project_id/projrole/:projrole_id/update" => 'projroles#update'
  match "/candidates/:id/project/:project_id/projrole/:projrole_id/show" => 'projroles#show'
  match "/candidates/:id/project/:project_id/projrole/:projrole_id/destroy" => 'projroles#destroy'
  # Education
  match "/candidates/:id/resume/education" => 'candidate_education#index'
  match "/education/destroy" => 'candidate_education#destroy'
  match "/education/:id" => 'education#index', :as => :candidate_education
  match "/candidates/:id/resume/education/create" => 'candidate_education#create', :as => :candidate_education_index
  match "/candidates/:id/resume/education/new" => 'candidate_education#new'
  match "/candidates/:id/resume/education/update" => 'candidate_education#update'
  match "/candidates/:id/resume/education/destroy" => 'candidate_education#destroy'
  match "/candidates/:id/resume/education/edit" => 'candidate_education#edit'

  # Certification
  #match "/candidates/:id/resume/certification" => 'candidate_certification#index'
  #match "/candidates/:id/resume/certification/new" => 'candidate_certification#new'
  match "/candidate_certifications/destro" => 'candidate_certifications#destro'
  #match "/resume_details/destro" => 'resume_details#destro'
  # Trainings
  match "/candidates/:id/resume/training" => 'resume_training#index'
  match "/candidates/:id/resume/training/new" => 'resume_training#new'
  match "/training/destroy" => 'resume_training#destroy'
  # Languages
  match "/candidates/:id/resume/languages" => 'candidate_languages#index'
  match "/candidates/resume/languages/new" => 'candidate_languages#new'
  match "/languages/destroy" => 'candidate_languages#destroy'

  # Autocomplete
  match "/tool/autocomplete" => 'tool_tag#autocomplete'
  match "/tech/autocomplete" => 'technology_tag#autocomplete'
  match "/know/autocomplete" => 'knowledge_tag#autocomplete'

  match '/skills', :to => 'skills#index'
  match '/skills/new', :to => 'skills#new'


  root :to => 'pages#home'
end
