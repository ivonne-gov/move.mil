Rails.application.routes.draw do
  resources :entitlements, only: [:index, :show]

  get '/customer-service', to: 'customer_service#index', as: 'customer_service'
  get '/faqs', to: 'faqs#index', as: 'faqs'

  get '/resources/locator-maps(/:latitude,:longitude)', to: 'locations#index', as: 'locations', constraints: {
    latitude: /[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?)/,
    longitude: /[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)/
  }

  post '/resources/locator-maps', to: 'locations#index'
  get '/resources/ppm-estimator', to: 'ppm_estimator#index', as: 'ppm_estimator'
  get '/resources/weight-estimator', to: 'weight_estimator#index', as: 'weight_estimator'
  get '/service-specific-information(/:id)', to: 'service_specific_information#show', as: 'service_specific_information'
  get '/tutorials(/:id)', to: 'tutorials#show', as: 'tutorial'

  get '/browserconfig.xml', to: 'meta#browserconfig', format: :xml
  get '/manifest.json', to: 'meta#manifest', format: :json
  get '/sitemap.xml', to: 'meta#sitemap', format: :xml

  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'

  # This line mounts Refinery's routes at the root of your application.
  # This means, any requests to the root URL of your application will go to Refinery::PagesController#home.
  # If you would like to change where this extension is mounted, simply change the
  # configuration option `mounted_path` to something different in config/initializers/refinery/core.rb
  #
  # We ask that you don't use the :as option here, as Refinery relies on it being the default of "refinery"
  mount Refinery::Core::Engine, at: Refinery::Core.mounted_path

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
