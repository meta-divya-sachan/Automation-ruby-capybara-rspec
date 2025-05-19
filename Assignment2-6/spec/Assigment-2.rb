require "capybara"
require "selenium-webdriver"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
session = Capybara::Session.new(:selenium_chrome)

session.driver.browser.manage.window.maximize
Capybara.default_selector = :xpath


#1. Open Google.com, 
session.visit('https://www.google.com/')
#verify Google Logo on the page
puts (session.has_selector?("//img[@id='hplogo']"))
sleep 2

#2. Enter Automation in search box and press enter
puts (session.has_selector?("//textarea[@id='APjFqb']"))
session.fill_in("APjFqb", with: "Automation").send_keys(:enter) 
#session.find(:xpath, "//*[@id='APjFqb']").set("Automation")
#other way to do it  by setting the value after finding xpath of name/id is not avilable 
Capybara.using_wait_time(5) do

#3. Get the text of the first searched link and verify, it should be “What is Automation? -Definition from Techopedi or IBM
getLinkText = session.find(:xpath, '(//h3)[1]').text
puts getLinkText
getLinkURLxpath = session.find(:xpath, '(//h3)[1]/ancestor::a[1]')
getLinkURL = getLinkURLxpath[:href]
puts "first URL is : " + getLinkURL
if getLinkText == "What Is Automation? - IBM" and getLinkURL.include?('ibm.com')
 puts 'Test case Passed'
else 
 puts 'Test case failed'

end
end
sleep 5