module OpenAI
  class OpenAPIException < StandardError

    attr_reader :message

    attr_reader :type

    attr_reader :param

    attr_reader :code

    def initialize(attributes)
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

  end

end