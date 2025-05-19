require 'C:\Users\Divya\Desktop\Automation\RSpec\helper\Config.rb'
require "capybara"
require "selenium-webdriver"

session = Capybara::Session.new(:selenium_chrome)

describe "Open the https://practice.automationtesting.in/shop/ site and assert below things:" do
  it "Verify Automation Practice site Logo" do
    
    session.driver.browser.manage.window.maximize
    session.visit('https://practice.automationtesting.in/shop/')
     #expect(session).find($Logo_img)
   puts expect(session).to have_selector($Logo_img, visible: true)
  end

  it "# 2. Home and Subscribe link should be displayed" do
   #session = Capybara::Session.new(:selenium_chrome)
   puts expect(session).to have_selector($Subscribe_button, visible:false)
   puts expect(session).to have_selector($Home_button, visible:false)
  end
  it "# 3. 5 tab / link with label Shop, My Account, Test Cases, At Site and Demo Site should be displayed at top." do
   puts expect(session).to have_selector($Shop_button, visible:true)
   puts expect(session).to have_selector($My_Account_button, visible:true)
   puts expect(session).to have_selector($Test_Cases_button, visible:true)
  
   puts expect(session).to have_selector($At_Site_link, visible:true)
   puts expect(session).to have_selector($Demo_Site_button, visible: true)
   puts "All tabs are verified"
   sleep 4

  end
  it "# 4. Click on Android of product categories" do  
   session.find($Android_category).click
   sleep 3
  end

  it "# 5. Verify no of records should be equal to the no given at the right side of android hyperlink" do  
   puts expect(session.find($Android_category_count).text).to eq("("+ session.all(:xpath, $Android_category).length.to_s + ")")
     
   sleep 3
  end

 it "# 6 Now get the amount of any one record and click on that record read more link" do  
    session.go_back
   amount_book1 = session.find($Amount).text
   puts amount_book1
   session.find($Read_more).click
  # 7. Verify User should be redirected to detail page and the amount of that book should be equal to amount of step"   
     puts expect(session.find($Amount_of_book).text).to eq(amount_book1)
     puts "we printed the amount"
     sleep 3
 end   
 end

# # Q2.Assert below things

describe "# 1. Open the https://practice.automationtesting.in/test-cases/ site" do
  
  it "# 2. Verify in HOME PAGE section there should be 18 links" do  
   session.visit("https://practice.automationtesting.in/test-cases/")
  end

  it "# 3 Click on first hyperlink and verify no of lines equal to 6" do  
   session.find($first_hyperlink).click
   sleep 5
   No_of_steps = session.all($No_of_links).count
   sleep 10
   puts expect(No_of_steps).to eq(6)

  end
  it "# 4. Now click on 3rd link and verify first link expanded section should be minimize" do  
  session.find($Third_hyperlink).click
  expect(session.all($No_of_links, visible:true))
 end

 

   
end






