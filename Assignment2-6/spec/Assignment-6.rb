# 1. Create 2 scripts with regression prefix in spec folder
# 2. Create 3 scripts with sanity prefix in spec folder
# Question 1: Create a rake task to run all Regression scripts
# Question 2: Create a rake task to run all Sanity scripts
# Question 3: Create a rake task to run All scripts in spec folder
# Question 4: Create a multi task to run regression and sanity task
# Reference syntax:
# task :task_name do
# puts "Description of task"
# RSpec::Core::RakeTask.new(:spec) do |t|
# t.pattern = "Your Pattern"
# end
# Rake::Task["spec"].execute
# end