Rails.application.routes.draw do
  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to
  # Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the
  # :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being
  # the default of "spree".
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  # post 'checkout/pay_fast_update/:payment', controller: 'spree/checkout', action: :pay_fast_update, as: 'pay_fast_update'
  Spree::Core::Engine.routes.draw do
    resource :pay_fast, only: [], controller: :pay_fast do
      post 'update', action: :update, as: 'pay_fast_update'
    end
  end
end
