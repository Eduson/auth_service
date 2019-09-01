# frozen_string_literal: true
Rails.application.routes.draw do
  namespace :api, as: nil do
    namespace :v1, as: nil do
      devise_for :users,
                 path: '',
                 path_names: {
                     sign_in: 'users/sign_in',
                     sign_out: 'users/sign_out',
                     registration: 'users/sign_up'
                 },
                 controllers: {
                     sessions: 'api/v1/users/sessions',
                     registrations: 'api/v1/users/registrations'
                 }

      match 'ping' => '/application#ping', via: :all
      match 'auth_ping' => '/application#auth_ping', via: :all
    end
  end

  # TODO
  # api_version(:module => "V1", :header => {:name => "Accept", :value => "application/vnd.mycompany.com; version=1"}, :path => {:value => "v1"}) do
  #   match '/foos.(:format)' => 'foos#index', :via => :get
  #   match '/foos_no_format' => 'foos#index', :via => :get
  #   resources :bars
  # end
end
