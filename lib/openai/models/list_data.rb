module OpenAI::Model

  class ListData
    # @return [Array[Assistant]] List assistants
    attr_reader :data

    # @return [String] first id
    attr_reader :first_id

    # @return [String] last id
    attr_reader :last_id

    # @return [bool] has more
    attr_reader :has_more

    def initialize(attributes)
      attributes.each do |key, value|
        instance_variable_set("@#{key}", key == 'data' ? parse_data(value) : value)
      end
    end

    def parse_data(value)
    end
  end

end