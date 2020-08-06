require_relative '../config/environment'

class SmokeTestPublisher
  def start
      publisher = RailwayIpc::Publisher.new(exchange_name: 'smoke_test')
    loop do
      message = RailwayIpc::Messages::TestMessage.new(uuid: SecureRandom.uuid)
      publisher.publish(message)
      sleep 2
    end
  end
end
