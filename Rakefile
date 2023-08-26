require 'rake'
require 'parallel'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:first) do |task|
  ENV['CONFIG_NAME'] ||= "first"
#   task.cucumber_opts = ['--format=pretty', '--require run-first-test/', 'run-first-test/']
end



task :default => :first

Cucumber::Rake::Task.new(:local) do |task|
#   task.cucumber_opts = ['--format=pretty', '--require run-local-test/', 'run-local-test/', 'CONFIG_NAME=local']
end

# Cucumber::Rake::Task.new(:chrome) do |task|
#   ENV['BROWSER'] ||= 'chrome'
#   task.cucumber_opts = ['features/login.feature']
# #   task.cucumber_opts = ['--format=pretty', '--require features/login.feature', 'features/login.feature']
# end
#
# Cucumber::Rake::Task.new(:firefox) do |task|
#   ENV['BROWSER'] ||= 'firefox'
#   task.cucumber_opts = ['features/login.feature']
# #   task.cucumber_opts = ['--format=pretty', '--require features/login.feature', 'features/login.feature']
# end

task :firefox do
    # sh "parallel_cucumber features/login.feature"
    sh "bundle exec cucumber features/login.feature BROWSER=firefox --format summary --format html --out firefox.html --format json --out cucumber.json"
end

task :chrome do
    # sh "parallel_cucumber features/login.feature"
    sh "bundle exec cucumber features/login.feature BROWSER=chrome --format summary --format html --out chrome.html --format json --out cucumber.json"
end

task :parallel do
  Parallel.each([:chrome, :firefox], in_threads: 2) do |task|
    Rake::Task[task].invoke
  end
end

# rake run_multiple_times[5]
task :run_multiple_times, [:task_count] do |t, args|
  task_count = args[:task_count].to_i

  if task_count > 0
    task_names = [:chrome, :firefox]  # Add more task symbols as needed

    task_names.each do |task_name|
      Rake::Task[task_name].invoke
    end

    (task_count - 1).times do
      task_names.each do |task_name|
        Rake::Task[task_name].reenable
        Rake::Task[task_name].invoke
      end
    end
  else
    puts "Invalid task count. Please provide a positive integer."
  end
end

task :run_parallel_tasks, [:task_count] do |t, args|
  task_count = args[:task_count].to_i

  if task_count > 0
    task_names = [:chrome, :firefox]  # Add more task symbols as needed

    Parallel.map(task_names, in_threads: task_count) do |task|
      Rake::Task[task].invoke
    end
  else
    puts "Invalid task count. Please provide a positive integer."
  end
end
