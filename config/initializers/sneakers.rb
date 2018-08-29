require 'sneakers'
require 'sneakers/metrics/logging_metrics'
require 'sneakers/handlers/maxretry'
amqp = Rails.application.credentials.dig(
      Rails.env.to_sym, :rabbitmq_amqp_uri)
Sneakers.configure  heartbeat: 3,
                    amqp: amqp,
                    vhost: '/',
                    exchange: 'sneakers',
                    exchange_type: :direct,
                    retry_exchange: 'activejob-retry',
                    retry_backoff_exchange: 'activejob-backoff',
                    retry_error_exchange: 'activejob-error',
                    retry_requeue_exchange: 'activejob-retry-requeue',
                    prefetch: 5,      # Grab 10 jobs together. Betterspeed.
                    threads: 5,      # Threadpool size (good to match prefetch)
                    timeout_job_after: 60.seconds,   # Maximal seconds to wait for job
                    start_worker_delay: 1, # Delay between thread startup
                    workers: 1, # Number of per-cpu processes to run
                    durable: true,           # Is queue durable?
                    env: Rails.env,          # Environment
                    metrics: Sneakers::Metrics::LoggingMetrics.new,
                    daemonize: false,      # Send to background
                    # log: 'sneakers.log',     # Log file
                    # pid_path: 'sneakers.pid' # Pid file
                    handler: Sneakers::Handlers::Maxretry



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
