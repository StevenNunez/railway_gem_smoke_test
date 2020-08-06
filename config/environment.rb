uri = "amqp://localhost"
ENV['RAILWAY_RABBITMQ_CONNECTION_URL'] = uri

require 'bundler'
Bundler.require
require_relative '../messages/test_message_pb.rb'

$:<< '../lib'
require 'publisher'
require 'consumers'
settings = AMQ::Settings.parse_amqp_url(uri)
default_connection = Bunny.new(uri, vhost: settings[:vhost])
Sneakers.configure(
  connection: default_connection,
)

ActiveRecord::Base.establish_connection("postgres://postgres:postgres@localhost/smoke_test")
#  env: "development",
#  workers: 1,
#  exchange: 'background_jobs',
#  timeout_job_after: 300,
#  prefetch: 4,
#  threads: 4,
#  hooks: {
#    before_fork: -> {
#      Sneakers::logger.info('Worker: Disconnect from the database')
#      ActiveRecord::Base.connection_pool.disconnect!
#    },
#    after_fork: -> {
#      Sneakers::logger.info('Worker: Reconnect from the database')
#    }
#  }
#)
