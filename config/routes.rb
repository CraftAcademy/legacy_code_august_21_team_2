# frozen_string_literal: true

Rails.application.routes.draw do  
  namespace :api do
    resources :analyses, only: :index
  end
  # get '/api/analyses', controller: :images, action: :image_analysis
end
