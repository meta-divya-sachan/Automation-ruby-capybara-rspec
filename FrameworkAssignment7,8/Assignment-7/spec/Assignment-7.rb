require 'C:/Users/Divya/Desktop/Automation/Rsspec, capybara, ruby/FrameworkAssignment7,8/Assignment-7/common_helper/config.rb'
require 'C:/Users/Divya/Desktop/Automation/Rsspec, capybara, ruby/FrameworkAssignment7,8/Assignment-7/common_helper/helper.rb'
#require 'rspec/retry'



# Note - Please follow the framework structure to automate below mentioned assignments.
# 1. Automate the Test case
$page.visit 'https://practice.automationtesting.in/basket/'
$page.current_window.maximize  
describe " Step 1 : Open URL “https://practice.automationtesting.in/basket/” " do
  it "Testing cart"
    
   # Step 2 : Register New user with dummy email
      $page.find($My_Account_button).click
      random_email = $email
      puts random_email
      $page.find($email_input).set(random_email)
      $page.find($password_input).set("TestDoc@1234")
      sleep 3  
      $page.find($Register_button).click
      puts "Registered successfully!!"
   # Step 3 : Check if the user is already registered then click on login else sign out the new registered user and login.
   if ($page.has_no_xpath?($already_registered_error))
      $page.find($log_out_button).click
      $page.find($login_input_email).set(random_email)
      $page.find($login_input_password).set("TestDoc@1234")
      $page.find($log_in_button).click
      puts "Logged in successfully!!"
   else
      $page.find($log_in_button).click
   end 
   # Step 4 : Go to Shop.
   $page.find($shop_tab).click
   # Step 5 : Check all the options for books (Selenium, java ,android) , open each link and verify the book count is the same in the heading.
   compare("android",1)
   $page.find($shop_tab).click
   compare("javascript",3)
   $page.find($shop_tab).click
   compare("selenium",4)
   sleep 4
#   # Step 6 : Add One book to cart and verify it is added and amount should be the same.
   amount = $page.find($amount_of_book_on_page).text
   $page.find($add_to_cart).click
   $page.find($cart_button).click
   amount = $page.find(amount_cart).text
   puts expect(amount).eql?amount_cart

#   # Step 7 : Remove book from cart.
   $page.find($remove_book_cart).click
  
#   # Create Example.file for the execution and add retry option.
  # RSpec.configure do |config|
  # config.example_status_persistence_file_path = 'spec/examples.txt'
  # config.default_retry_count=2
  # end

end
