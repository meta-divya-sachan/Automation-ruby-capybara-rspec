require 'capybara'
require 'rspec'
require "selenium-webdriver"
#require 'C:/Users/Divya/Desktop/Automation/Rsspec, capybara, ruby/FrameworkAssignment7,8/Assignment-7/common_helper/helper.rb'

#xpaths and variables for the assignment-7
$My_Account_button = "//*[@id='menu-item-50']/a"
$email_input ="//*[@id='reg_email']"
$password_input="//*[@id='reg_password']"
$Register_button="//*[@id='customer_login']/div[2]/form/p[3]/input[3]"
$log_out_button= "//*[@id='page-36']/div/div[1]/nav/ul/li[6]/a"
$login_input_email = "//*[@id='username']"
$login_input_password = "//*[@id='password']"
$log_in_button= "//*[@id='customer_login']/div[1]/form/p[3]/input[3]"
$shop_tab="//*[@id='menu-item-40']/a"
$email ="xyzyvl"+rand.to_s[2..100]+"@gmail.com"
$already_registered_error="//li[text()=' An account is already registered with your email address. Please login.']"
$add_to_cart = "//*[@id='content']/ul/li/a[2]"
$amount_of_book_on_page = "//*[@id='content']/ul/li/a[1]/span/span/text()"
$cart_button = "//*[@id='wpmenucartli']/a/span[1]"
$amount_cart = "//*[@id='page-34']/div/div[1]/form/table/tbody/tr[1]/td[6]/span"
$remove_book_cart = "//*[@id='page-34']/div/div[1]/form/table/tbody/tr[1]/td[1]/a"

def compare(link_xpath,i)
  dynamic_xpath = "//a[@href='https://practice.automationtesting.in/product-category/#{link_xpath}/']"
  $page.find(:xpath, dynamic_xpath).click
  product = $page.all(:xpath,'//a[@class="woocommerce-LoopProduct-link"]')
  count_product = product.length.to_s
  dynamic_xpath2 = "(//span[@class='count'])[#{i}]"
  value_count = $page.find(:xpath,dynamic_xpath2).text
  removed_bracket = value_count.delete("()")
  puts removed_bracket
  puts $page.expect(removed_bracket).eql? value_count
  
end



































































# def count_product(category,i)
#  puts category
#  link_xpath = "//*[@id='woocommerce_product_categories-2']/ul/li[#{i}]/span"
#  NumberOfProduct = page.find(:xpath, link_xpath).text
#  puts NumberOfProduct
#  book_number = NumberOfProduct.delete("()")
#  $dynamic_xpath = "//*[@id='woocommerce_product_categories-2']/ul/li[#{i}]/a']"
#  $page.find(:xpath, dynamic_xpath).click
#  $BookVisible = $page.all(:xpath, "//*[@id='content']/ul/li").count.to_s
#  expect(book_number).to eq BookVisible
#  puts "Number of products are matching."
# end