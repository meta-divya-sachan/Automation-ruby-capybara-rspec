require "capybara";
 require "selenium_webdriver";

 Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser => :chrome)
 end
 session = Capybara::Session.new(:selenium_chrome)
 session.visit('https://www.google.co.in/')
 
