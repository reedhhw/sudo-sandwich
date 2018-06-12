ENV["RACK_ENV"] = "test"
ENV["ENCRYPTION_KEY"]="This is a key that is 256 bits!!"

require File.expand_path("../../config/environment", __FILE__)
abort("DATABASE_URL environment variable is set") if ENV["DATABASE_URL"]

require "rspec/rails"

Dir[Rails.root.join("spec/support/*.rb")].sort.each { |file| require file }

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = true
  config.include BasicAuthHelper, type: :controller
end

ActiveRecord::Migration.maintain_test_schema!
