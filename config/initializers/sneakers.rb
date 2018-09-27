# frozen_string_literal: true

require 'sneakers'
require 'sneakers/metrics/logging_metrics'
require 'sneakers/handlers/maxretry'
amqp = Rails.application.credentials.dig(
  Rails.env.to_sym, :rabbitmq_amqp_uri
)
Sneakers.configure  heartbeat: 5,
                    amqp: amqp,
                    vhost: '/',
                    exchange: 'sneakers',
                    exchange_type: :direct,
                    retry_exchange: 'activejob-retry',
                    retry_backoff_exchange: 'activejob-backoff',
                    retry_error_exchange: 'activejob-error',
                    retry_requeue_exchange: 'activejob-retry-requeue',
                    prefetch: 10, # Grab 10 jobs together. Betterspeed.
                    threads: 10, # Threadpool size (good to match prefetch)
                    timeout_job_after: 60.seconds, # Maximal seconds to wait for job
                    start_worker_delay: 1, # Delay between thread startup
                    workers: 1, # Number of per-cpu processes to run
                    durable: true,           # Is queue durable?
                    env: Rails.env,          # Environment
                    metrics: Sneakers::Metrics::LoggingMetrics.new,
                    daemonize: false, # Send to background
                    # log: 'sneakers.log',     # Log file
                    # pid_path: 'sneakers.pid' # Pid file
                    handler: Sneakers::Handlers::Maxretry,
                    ack: true               # Must we acknowledge?


# Sneakers.configure({
#
#   amqp: "amqp://gues:gues@127.0.0.1:5672",
#
#   vhost: "/",
#
#   heartbeat: 5,            # Keep a good connection with broker
#   # timeout_job_after: 5,    # Maximal seconds to wait for job
#   # prefetch: 10,            # Grab 10 jobs together. Better speed.
#   # threads: 10,             # Threadpool size (good to match prefetch)
#   # workers: 4,              # Number of per-cpu processes to run
#   # start_worker_delay: 0.3, # Delay between thread startup
#   # env: Rails.env,          # Environment
#   # durable: true,           # Is queue durable?
#   # ack: true,               # Must we acknowledge?
#   # exchange: 'sneakers',    # AMQP exchange
#   # hooks: {},               # prefork/postfork hooks
#   # runner_config_file: nil, # A configuration file (see below)
#   # metrics: Sneakers::Metrics::LoggingMetrics.new,    # A metrics provider implementation
#   # daemonize: true,         # Send to background
#   # log: 'sneakers.log',     # Log file
#   # pid_path: 'sneakers.pid', # Pid file
#   # handler: Sneakers::Handlers::Maxretry
# })

Sneakers.logger.level = Logger::INFO

# Preload all jobs defined for the application
Dir.glob(File.expand_path("app/jobs/*_job.rb", Rails.root)).each do |job_file|
  require job_file
end

# Then create a list of queues names based on the defined jobs
queues = ApplicationJob.descendants.map(&:queue_name).uniq

# Finally, dynamically create a worker class for each queue name, very much
# as you do in #331, but including the Sneakers::Worker module again, to force
# Sneakers to add the new class to its classes array
queues.each do |queue_name|
  Object.const_set("#{queue_name}_worker".classify,
    Class.new(ActiveJob::QueueAdapters::SneakersAdapter::JobWrapper) do
      include Sneakers::Worker
      from_queue queue_name
    end)
end
