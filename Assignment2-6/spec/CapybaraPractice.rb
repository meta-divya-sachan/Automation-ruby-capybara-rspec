require "capybara"
require "selenium-webdriver"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
session = Capybara::Session.new(:selenium_chrome)

session.driver.browser.manage.window.maximize
Capybara.default_selector = :xpath

#Navigating
sleep 2
session.visit('https://www.opencart.com/')
#Clicking links and buttons click_on 'Link Text', click_button, click_link
session.click_on('Get Started')
session.find_element(:tag_name, "body").send_keys "\uE00F"
sleep 4
session.find_element(:class, 'col-md-12').send_keys "\uE00F"
sleep 4
session.click_link(text,'GET STARTED')

sleep 10
session.click_button('Login')

sleep 10
