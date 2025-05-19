require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

driver.get "http://google.com"

element = driver.find_element(:id, 'lst-ib')
# Open a new tab using CTRL + T
element.send_keys(:control, 't')

 # Use 'sleep' instead of 'sleept'
sleep 5
# Switch to the newly opened tab using CTRL + Tab
#driver.action.key_down(:control).send_keys(:tab).key_up(:control).perform
