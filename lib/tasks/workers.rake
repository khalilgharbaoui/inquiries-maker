# frozen_string_literal: true

namespace :workers do
  desc 'Wait 8 seconds and start the workers'
  task run: :environment do
    ActiveRecord::Base.logger = nil
    5.times do
      warn "[PID: #{Process.pid}] run rabit run...🐰 #{Time.now}"
      sleep 2
    end
    Rake::Task['sneakers:run'].invoke
  end
end
