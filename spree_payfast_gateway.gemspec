lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_payfast_gateway/version'

Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY
  spec.name        = 'spree_payfast_gateway'
  spec.version     = SpreePayfastGateway::VERSION
  spec.summary     = 'Adds spree_payfast_gateway as a Payment Method to Spree Commerce'
  spec.description = spec.summary
  spec.required_ruby_version = '>= 2.3.8'

  spec.author       = 'Alec van Niekerk'
  spec.email        = 'alecfvn@gmail.com'
  spec.homepage     = 'https://github.com/alecvn/spree-payfast-gateway'

  spec.files        = `git ls-files`.split("\n")
  spec.test_files   = `git ls-files -- spec/*`.split("\n")
  spec.require_path = 'lib'
  # spec.requirements << 'none'

  spree_version = '>= 3.5.0', '< 5.0'
  spec.add_dependency 'spree_backend', spree_version
  spec.add_dependency 'spree_core', spree_version
  spec.add_dependency 'spree_frontend', spree_version
  spec.add_dependency 'spree_extension'

  spec.add_development_dependency 'sass-rails'
  # spec.add_development_dependency 'capybara', '~> 2.1'
  # spec.add_development_dependency 'database_cleaner', '1.0.1'
  # spec.add_development_dependency 'factory_girl', '~> 4.2'
  # spec.add_development_dependency 'pry'
  # spec.add_development_dependency 'rspec-rails', '~> 2.14.0'
  # spec.add_development_dependency 'simplecov'
end
