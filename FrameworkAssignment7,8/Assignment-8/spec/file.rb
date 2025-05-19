require 'C:\Users\Divya\Desktop\Automation\Rsspec, capybara, ruby\FrameworkAssignment7,8\Assignment-8\Common_helper\config.rb'
require 'C:\Users\Divya\Desktop\Automation\Rsspec, capybara, ruby\FrameworkAssignment7,8\Assignment-8\Common_helper\helper.rb'

describe "login" do
	before(:all) do
		@log_file = File.open('test.log', 'o')
		@logger = Logger.new(@log_file)
	end

	after(:all) do
		@log_file.close
	end
	
	it "Log in to site and read the credentials from file" do
	
	  #open the sheet 
		doc = Spreadsheet.open('C:\Users\Divya\Desktop\Automation\Rsspec, capybara, ruby\FrameworkAssignment7,8\Assignment-8\spec\test.xls', "r")
		#read and story the values in the array DS in the  returned array
		array=Sheet.reading(doc)
		#extract and assign 
		username=array[1][0]
		password=array[1][1]
		#visit site and login
		$page.visit('https://www.saucedemo.com/')
		@logger.info("Visited to the url")
		$page.find($user_input).set(username)
		@logger.info("set the username #{username}")
		$page.find($password_input).set(password)
		encrypted_password= password.tr('a-z','*')
		@logger.info ("set the password #{encrypted_password}")
		$page.find($login_button).click
		sleep 4
		@logger.info("Successfully logged in!!! congo!!")
	
	end
end	