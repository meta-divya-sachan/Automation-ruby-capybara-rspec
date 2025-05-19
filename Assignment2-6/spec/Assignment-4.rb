require "capybara"
require "selenium-webdriver"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
session = Capybara::Session.new(:selenium_chrome)

session.driver.browser.manage.window.maximize



# Question 1. Create an automation script to sign up using Rspec
# Steps:
# 1. 1. Open the site https://practice.automationtesting.in/
describe "Open the site https://practice.automationtesting.in/" do
  it "should Open the site https://practice.automationtesting.in/ " do
     session.visit('https://practice.automationtesting.in/')
     session.find(:xpath, '//div[@id="site-logo"]')
      sleep 3
  end   
 end


# 2. Go to Shop
describe "go to the shop" do
  it "should navigate to the shop" do
      session.find(:xpath, '//li[@id= "menu-item-40"]/child::a').click
      sleep 5
  end   
 end

# 3. Click on Android from left panel and get the count of available books/courses
describe "Click on Android from left panel and get the count of available books/courses" do
  it "Should Click on Android and count of available books/courses" do
     #before(:each) do
     session.find(:xpath, "//a[text() = 'Android']").click
      puts "Count of available books/courses :" + session.all(:xpath, "//a[@class='woocommerce-LoopProduct-link']").count.to_s
      
      # Why not this way?          
      # c = Array.new 
      # i = 0
      # if =
      # for c[i] in c.size do
      #   t >>  session.all(:xpath, "//a[@class='woocommerce-LoopProduct-link'/[i]]")
      #   i++
      #   puts c[i]
      # puts c.size
       
  end   
 end

# 4. Assert after applying filter count shown on link and no of books shown on screen should be same
describe "after applying filter" do
 it "count shown on link and no of books shown on screen should be same" do
 session.go_back
 session.click_button("Filter")
 NumberOfLink = session.all(:xpath, "//a[@class='woocommerce-LoopProduct-link']").count.to_s
 puts "Number of Links of books  #{NumberOfLink}"
 BookVisible = session.all(:xpath, "//a/child::h3").count.to_s
 puts "Number of books visble on site #{BookVisible}" 
 puts expect(NumberOfLink).eql?BookVisible
 sleep 3
 end
end

# 5. Add books in cart and assert the amount of books
describe "Add books in cart and assert the amount of books" do
  it "should Add books in cart and assert the amount of books" do
   sleep 3
    i=1
   for i in 1..5 do
    if i < 6
    session.find(:xpath, "//*[@id='content']/ul/li["+i.to_s+"]/a[2]").click
    sleep 2
      i= i+1
    else
      puts "Added #{i} items in the cart"
    end
   end
  sleep 2

  puts expect(session).to have_xpath("//*[@id='content']/ul/li[1]/a[1]/span[2]/ins/span", text: "450.00")
  sleep 3
  
  end
 end

# 6. Remove one book and Assert the amount of books


describe "Remove one book and Assert the amount of books" do
  it "should Remove one book and Assert the amount of books" do
      session.find(:xpath, "//*[@id='wpmenucartli']/a/span[2]").click
      RemoveBooks=1  
        for RemoveBooks in 1..2 do 
         if RemoveBooks <3
          session.find(:xpath, "//*[@id='page-34']/div/div[1]/form/table/tbody/tr["+RemoveBooks.to_s+"]/td[1]/a").click    
          sleep 2
              
         else 
         puts "Removed #{RemoveBooks} items from the cart"
         puts "Total amount is : "  
         end
         RemoveBooks= RemoveBooks+1
       end
 end
end



# Question 2: Create an automation script using Rspec and capybara
# Steps:
# 1. Go to the link http://practice.automationtesting.in/my-account/
describe "Open to the link http://practice.automationtesting.in/my-account" do
  it "should o to the link http://practice.automationtesting.in/my-account" do
     session.visit('http://practice.automationtesting.in/my-account')
      sleep 3  
  end   
 end

# 2. Enter Email address and Password to Register
describe "Enter Email address and Password to Register" do
  it "should Enter Email address and Password to Register " do
      $ email ="xyzyvl"+rand.to_s[2..100]+"@gmail.com"
      session.find(:xpath, "//*[@id='reg_email']").set(email)
      session.find(:xpath, "//*[@id='reg_password']").set("TestDoc@1234")
      sleep 3  
  end   
 end

# 3. Click on Register button
describe "Click on Register button" do
  it "should Click on Register buttonr " do
      session.click_button('register')
      sleep 3  
  end   
 end

# 4. Assert user registration successful by verifying sign out hyperlink
describe "Assert user registration successful by verifying sign out hyperlink" do
  it "should Assert user registration successful by verifying sign out hyperlink" do
      expect(session).to have_selector(:css, 'a[href="https://practice.automationtesting.in/my-account/customer-logout/"]') 
      puts "Regustration successful"
      sleep 3  
  end   
 end

# 5. Verify Dashboard, Orders, Downloads, Addresses, Account Details and Logout hyperlinks
describe "Assert  Dashboard, Orders, Downloads, Addresses, Account Details and Logout hyperlinks" do
  it "should Verify Dashboard, Orders, Downloads, Addresses, Account Details and Logout hyperlinks" do
      #before(:each) do
     puts expect(session).to have_selector(:css, 'a[href="https://practice.automationtesting.in/my-account/"]')
     puts expect(session).to have_selector(:css, 'a[href="https://practice.automationtesting.in/my-account/orders/"]')
     puts expect(session).to have_selector(:css, 'a[href="https://practice.automationtesting.in/my-account/downloads/"]')
     puts expect(session).to have_selector(:css, 'a[href="https://practice.automationtesting.in/my-account/edit-address/"]')
     puts expect(session).to have_selector(:css, 'a[href="https://practice.automationtesting.in/my-account/edit-account/"]')
     puts expect(session).to have_selector(:css, 'a[href="https://practice.automationtesting.in/my-account/customer-logout/"]')
     sleep 3  
  end   
 end
# 6. Click on Account Details hyperlink
describe "Click on Account Details hyperlink" do
  it "should Click on Account Details hyperlink" do
      session.find(:xpath, "//*[@id='page-36']/div/div[1]/nav/ul/li[5]/a']").click
      sleep 3  
  end   
 end
# 7. Verify Email address field value should be the email you entered while registration
describe "Verify Email address field value should be the email you entered while registration" do
  it "Should Verify Email address field value should be the email you entered while registration" do
      session.find(:xpath, "//*[@id='account_email']").text.should eql?(email)
      sleep 3  
  end   
 end
 