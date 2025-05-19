require "capybara"
require "selenium-webdriver"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
session = Capybara::Session.new(:selenium_chrome)

session.driver.browser.manage.window.maximize
Capybara.default_selector = :xpath

# Q. Create an automation test script to search automation in google using RSpec.
# Steps to follow:
# 1. Open Google.com, verify Google Logo on the page
session.visit('https://www.google.com/')
puts (session.has_selector?("//img[@id='hplogo']"))
sleep 2
# 2. Enter “What is rspec” in search box and press enter
puts (session.has_selector?("//textarea[@id='APjFqb']"))
session.fill_in("APjFqb", with: "Rspec tutorial").send_keys(:enter)
sleep 5
# 3. Get the text of the first searched link
getLinkText = session.find(:xpath, '(//h3)[1]').text
puts getLinkText
getLinkURLxpath = session.find(:xpath, '(//h3)[1]/ancestor::a[1]')
getLinkURL = getLinkURLxpath[:href]
puts "first URL is : " + getLinkURL
# IF it is “RSpec Tutorial - Tutorialspoint” then Click on the first searched link, and
# verify the logo of Tutorialspoint in the opened page.
# OR
if getLinkText == "RSpec Tutorial" and getLinkURL.include?('tutorialspoint.com')
  puts 'Test case Passed'
  session.find(:xpath, '(//svg[@class="logo-desktop"])[1]/ancestor::a[1]').click
  puts (session.has_selector?("//svg[@class='logo-desktop']"))
# IF it is other than “RSpec Tutorial - Tutorialspoint” then Click on the first
# searched link, and verify the logo/header of the opened link in the opened page
 else 
  puts 'Test case failed'
  session.find(:xpath, '(//h3)[1]/ancestor::a[1]').click
  puts (session.has_selector?("//img[@id='hplogo']"))
 
 end

sleep 5