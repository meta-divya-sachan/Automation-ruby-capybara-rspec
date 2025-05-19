require "capybara"
require "capybara/dsl"
require "selenium-webdriver"
require "capybara/rspec"


Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :selenium
Capybara.default_selector = :xpath
Capybara.default_max_wait_time=10

#xpath for Assignment5_1.rb file
$Logo_img = "//*[@id='site-logo']/a/img"
$Home_button = "//a[text()='Home']"
$Subscribe_button = "//*[@id='mc4wp-form-1']/div[1]/p[2]/input"
$Shop_button = "//a[text()='Shop']"
##$top_tabs= "//li[contains(@id,'menu-item')]"
$Test_Cases_button = "//*[@id='menu-item-224']/a"
$My_Account_button = "//a[text()='My Account']"
$At_Site_link = "//a[text()='AT Site']"
$Demo_Site_button = "//*[@id='menu-item-251']/a"
$Android_category = "//a[text()='Android']"
$Android_category_count = "//a[text()='Android']/following-sibling::span"
$Read_more= "//*[@id='content']/ul/li[1]/a[1]"
$Amount="//*[@id='content']/ul/li[1]/a[1]/span[2]/ins/span"
#$Amount_of_book = "//*[@id='product-169']/div[2]/div[1]/p/ins/span"
$Amount_of_book = "//div[@id='product-169']//..//ins/span[@class='woocommerce-Price-amount amount']"



# $price2_text="(//span[@class='woocommerce-Price-amount amount'])[2]"

# question -2
$first_hyperlink="//*[@id='accordion-222-sub_row_1-0-1-0-0']/ul/li[1]/div[1]/a"
$No_of_links="//*[@id='accordion-222-sub_row_1-0-1-0-0']/ul/li[1]/div[2]/p/span"
$Third_hyperlink="//*[@id='accordion-222-sub_row_1-0-1-0-0']/ul/li[3]/div[1]/a"


