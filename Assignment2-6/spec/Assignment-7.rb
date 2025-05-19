require '../Common_helper/config.rb'
require '../Common_helper/helper.rb'
require 'rspec/retry'

# Note - Please follow the framework structure to automate below mentioned assignments.
# 1. Automate the Test case
# Step 1 : Open URL “https://practice.automationtesting.in/basket/”
# Step 2 : Register New user with dummy email
# Step 3 : Check if the user is already registered then click on login else sign out the new registered user and login.
# Step 4 : Go to Shop.
# Step 5 : Check all the options for books (Selenium, java ,android) , open each link and verify the book count is the same in the heading.
# Step 6 : Add One book to cart and verify it is added and amount should be the same.
# Step 7 : Remove book from cart.
# Create Example.file for the execution and add retry option.