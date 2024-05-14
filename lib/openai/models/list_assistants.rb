require_relative 'list_data'
require_relative 'assistant'

module OpenAI::Model
  class ListAssistants < ListData
    private
    def parse_data(value)
      value.map do |element|
        Assistant.new(element)
      end
    end

  end
end