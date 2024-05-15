
module OpenAI::Model
  # Represents an OpenAI Assistant
  class Assistant

    # @return [String] The identifier, which can be referenced in API endpoints.
    attr_reader :id

    # @return [String] The object type, which is always assistant.
    attr_reader :object

    # @return [Integer] The Unix timestamp (in seconds) for when the assistant was created.
    attr_reader :created_at

    # @return [String | nil] The name of the assistant. The maximum length is 256 characters.
    attr_reader :name

    # @return [String | nil] The description of the assistant. The maximum length is 512 characters.
    attr_reader :description

    # @return [String] ID of the model to use.
    attr_reader :model

    # @return [String | nil] The system instructions that the assistant uses. The maximum length is 256,000 characters.
    attr_reader :instructions

    # @return [Array] A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types code_interpreter, file_search, or function
    attr_reader :tools

    # @return [String | nul] A set of resources that are used by the assistant's tools. The resources are specific to the type of tool. For example, the code_interpreter tool requires a list of file IDs, while the file_search tool requires a list of vector store IDs.
    attr_reader :tool_resources

    # @return [Hash] Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maximum of 512 characters long.
    attr_reader :metadata

    # @return [Numeric | nil] What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    attr_reader :temperature

    # @return [Numeric | nil] An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered. We generally recommend altering this or temperature but not both.
    attr_reader :top_p

    # @return [String] Specifies the format that the model must output.
    attr_reader :response_format

    def initialize(attributes)
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

  end
end
