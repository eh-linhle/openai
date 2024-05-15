require_relative 'rest_client'
require_relative 'assistant_client'
require_relative 'message_client'
require_relative 'run_client'


module OpenAI

  class Client
    attr_reader :assistant, :message, :run

    def initialize(api_key)
      @rest = RestClient.new(api_key)
      @assistant = AssistantClient.new(@rest)
      @message = MessageClient.new(@rest)
      @run = RunClient.new(@rest)
    end

  end

end