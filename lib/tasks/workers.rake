# frozen_string_literal: true

namespace :workers do
  desc 'Wait 3 seconds and start the workers'
  task run: :environment do
    ActiveRecord::Base.logger = nil
    3.times do
      warn "[PID: #{Process.pid}] run rabit run...🐰 #{Time.now}"
      sleep 1
    end
    Rake::Task['sneakers:run'].invoke
  end
end
