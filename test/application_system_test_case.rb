require 'test_helper'
# require 'capybara/rails'
# require 'capybara/rspec'
# require 'capybara-screenshot/rspec'
# require 'selenium-webdriver'
# require 'socket'
# require 'webdrivers/chromedriver'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # include Devise::Test::IntegrationHelpers  
  # driven_by :selenium, using: :selenium_chrome_headless, screen_size: [1400, 1400], options: {url: "http://chrome:4444/wd/hub"}
  
  # def setup
  #   host! "http://#{IPSocket.getaddress(Socket.gethostname)}"
  #   super
  # end

  # driven_by :headless_chrome, screen_size: [1400, 1400]
  
  # Capybara.register_driver :headless_chrome do |app|
  #   capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
  #     chromeOptions: { args: %w(headless disable-gpu) }
  #   )
  
  #   Capybara::Selenium::Driver.new app,
  #     browser: :chrome,
  #     desired_capabilities: capabilities
  # end


  # This sets Capybara up to use a REMOTE Selenium server
  # Capybara.javascript_driver = :selenium_remote_chrome
  # Capybara.register_driver "selenium_remote_chrome".to_sym do |app|
  #   capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
  #     chromeOptions: { args: %w(headless no-gpu) }  )
  #   Capybara::Selenium::Driver.new(app, browser: :remote, url: "http://localhost:4220/wd/hub", desired_capabilities: capabilities)
  # end

  # agent = Capybara::Session.new(:selenium_remote_chrome)
  # Capybara.ignore_hidden_elements = false
  # Capybara.save_path = "spec/screenshots"
  # Capybara::Screenshot.autosave_on_failure = false
  
  # Capybara::Screenshot.prune_strategy = :keep_last_run
  # Capybara::Screenshot.register_driver(:chrome) do |driver, path|
  #   driver.browser.save_screenshot(path)
  # end
end
