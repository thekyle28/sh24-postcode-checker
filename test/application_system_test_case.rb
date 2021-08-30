require 'test_helper'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'selenium-webdriver'
require 'webdrivers/chromedriver'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  Capybara.asset_host = 'http://localhost:3000'
  CAPYBARA_WINDOW_SIZE = [1366, 768].freeze
  Capybara.register_driver :chrome_headless do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument("headless")
    options.add_argument("window-size=#{CAPYBARA_WINDOW_SIZE.join(',')}")
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: options
    )
  end
  Capybara.javascript_driver = :chrome
  Capybara.ignore_hidden_elements = false
  Capybara.save_path = "spec/screenshots"
  Capybara::Screenshot.autosave_on_failure = false
  
  Capybara::Screenshot.prune_strategy = :keep_last_run
  Capybara::Screenshot.register_driver(:chrome) do |driver, path|
    driver.browser.save_screenshot(path)
  end

end
