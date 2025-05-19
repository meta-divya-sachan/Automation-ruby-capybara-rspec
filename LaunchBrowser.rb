require 'rubygems'
require 'Selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.navigation.to "https://google.com"
puts "Google Launched"