require 'selenium-webdriver'
driver = Selenium::WebDriver.for:chrome
driver.get "http://amazon.com"
# Unicode key for scroll up
driver.find_element(:tag_name, "body").send_keys "\uE00F"
sleep 2
# Unicode key for up 
driver.find_element(:tag_name, "body").send_keys "\ue013"
sleep 2
# Unicode key for down
driver.find_element(:tag_name, "body").send_keys "\ue015"
sleep 2
driver.find_element(:tag_name, "body").send_keys "\uE00F"

# Perform actions using ActionBuilder
actions = Selenium::WebDriver::ActionBuilder.new(driver)

# Send shortcut keys (e.g., CTRL + A to select all text)
actions.key_down(:control)
       .send_keys('a')
       .key_up(:control)
       .perform

# Example: Send CTRL + C to copy the selected text
actions.key_down(:control)
       .send_keys('c')
       .key_up(:control)
       .perform

# Close the browser
driver.quit

#driver.keyboard.send_keys [:control, "t"]
#sleep 5
#driver.keyboard.send_keys[:control, :tab]



