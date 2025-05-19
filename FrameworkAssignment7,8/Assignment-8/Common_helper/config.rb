require 'C:\Users\Divya\Desktop\Automation\Rsspec, capybara, ruby\FrameworkAssignment7,8\Assignment-8\Common_helper\helper.rb'
#xpath
$user_input="//input[@id='user-name']"
$password_input="//input[@id='password']"
$login_button="//input[@id='login-button']"

module Sheet

def Sheet.reading doc
		sheet = doc.worksheet 0
		hash = {}
		sheet.each do |row|
	  
		next if row[0].nil? || row[1].nil?
			key=row[0]
			value=row[1]
			hash[key]=value
		end
	  
		array=hash.to_a
		return array
end

end
	



