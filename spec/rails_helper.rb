# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# специальные "матчеры" - методы, удобные для тестирования валидаций
Shoulda::Matchers.configure do |config|
  config.integrate do |with| with.test_framework :rspec
    with.library :rails
  end
end

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # Подключаем девайзовые классы для использвоания в тестах
  # https://github.com/plataformatec/devise#test-helpers
  # https://github.com/plataformatec/devise/issues/4133

  # В тестах на контроллеры и представления подключаем специальные
  # хелперы для авторизации с помощью девайс
  config.include Devise::TestHelpers, type: :controller
  config.include Devise::TestHelpers, type: :view

  # Подключаем в фичах специальные хелперы для авторизации
  config.include Warden::Test::Helpers, type: :feature

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

# Это нужно, чтобы капибара искала стили и js в правильном месте
Capybara.asset_host = "http://localhost:3000"

