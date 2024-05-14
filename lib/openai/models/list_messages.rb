require_relative 'list_data'
require_relative 'message'

module OpenAI::Model
  class ListMessages < ListData
    private
    def parse_data(value)
      value.map do |element|
        Message.new(element)
      end
    end

  end
end