# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :images
    #get 'images/image_analysis'
  end
  #get '/api/images', controller: :images, action: :image_analysis
end
