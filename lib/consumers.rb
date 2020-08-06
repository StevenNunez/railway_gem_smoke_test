require_relative '../config/environment'

class Handler1
  def handle(message)
    p message.uuid
    p "=========================Handler1 Called =========================="
    OpenStruct.new(success?: true)
  end
end
class SmokeTestConsumer1 < RailwayIpc::Consumer
  listen_to queue: 'consumer1', exchange: 'smoke_test'
  handle RailwayIpc::Messages::TestMessage, with: Handler1
end

class Handler2
  def handle(message)
    p message.uuid
    p "=========================Handler2 Called =========================="
    OpenStruct.new(success?: true)
  end
end
class SmokeTestConsumer2 < RailwayIpc::Consumer
  listen_to queue: 'consumer2', exchange: 'smoke_test'
  handle RailwayIpc::Messages::TestMessage, with: Handler2
end
