ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  VALID_POSTCODES = %w[SE10AA SW1A1AA SH241AA]
  INVALID_POSTCODES = %w[XYZ]
  TEST_POSTCODES = VALID_POSTCODES + INVALID_POSTCODES

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
end
