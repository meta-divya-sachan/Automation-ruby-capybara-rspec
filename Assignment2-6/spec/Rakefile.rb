require 'rspec/core/rake_task'

#Task for  Regression TC

task :regression do
puts "Running regression TC"
 	RSpec::Core::RakeTask.new(:spec) do |d|
	r.pattern = "spec/Regression*.rb"
   	end
  	 Rake::Task["spec"].execute
end

#Task for run Sanity TC
task :sanity do
puts "Running sanity TC"
 	RSpec::Core::RakeTask.new(:s1 do |d|
	r.pattern = "spec/Sanity*.rb"
   	end
  	 Rake::Task["spec1"].execute
end

#Task to run all TC in Spec folder
task :all_script do
puts "Running all TC"
 	RSpec::Core::RakeTask.new(:s2) do |d|
	r.pattern = "spec/*.rb"
   	end
  	 Rake::Task["spec2"].execute
end

#Task to run multiple scripts
multitask :multiple_scripts => [:sanity, :regression] do
puts "multiple scripts"
end