require 'capybara'
require 'capybara/dsl'
require 'rspec/core'
require 'capybara/rspec/matchers'
require 'capybara/rspec/features'
require "selenium-webdriver"
require 'capybara/rspec'
require 'spreadsheet'
require 'logger'

extend Capybara::DSL
extend RSpec::Matchers

Capybara.register_driver :chrome do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :chrome
Capybara.default_selector= :xpath 

Capybara.configure do |config|
	config.default_max_wait_time = 10
end


$page = Capybara::Session.new(:selenium_chrome) 
#Capybara.current_session.driver.browser.manage.window.maximize
