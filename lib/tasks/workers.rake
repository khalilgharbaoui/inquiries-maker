namespace :workers do
  desc "Wait 8 seconds and start the workers"
  task :run => :environment do
    ActiveRecord::Base.logger = nil
    5.times do
      $stderr.puts "run rabit run...🐰 #{Time.now}"
      sleep 2
    end
    Rake::Task['sneakers:run'].invoke
  end
end
