
module OpenAI::Model
  class Message

    # @return [String] The identifier, which can be referenced in API endpoints.
    attr_reader :id

    # @return [String] The object type, which is always thread.message
    attr_reader :object

    # @return [Integer] The Unix timestamp (in seconds) for when the message was created.
    attr_reader :created_at

    # @return [Integer] The thread ID that this message belongs to.
    attr_reader :thread_id

    # @return [String] The status of the message, which can be either in_progress, incomplete, or completed.
    attr_reader :status

    # @return [String | nil] On an incomplete message, details about why the message is incomplete.
    attr_reader :incomplete_details

    # @return [Integer | nil] The Unix timestamp (in seconds) for when the message was completed.
    attr_reader :completed_at

    # @return [Integer | nil] The Unix timestamp (in seconds) for when the message was marked as incomplete.
    attr_reader :incomplete_at

    # @return [String] The entity that produced the message. One of user or assistant.
    attr_reader :role

    # @return [String] The content of the message in array of text and/or images.
    attr_reader :content

    # @return [String | nil] If applicable, the ID of the assistant that authored this message.
    attr_reader :assistant_id

    # @return [String | nil] The ID of the run associated with the creation of this message. Value is null when messages are created manually using the create message or create thread endpoints.
    attr_reader :run_id

    # @return [String] A list of files attached to the message, and the tools they were added to.
    attr_reader :attachments

    # @return [Hash[String, String]] Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maximum of 512 characters long.
    attr_reader :metadata

    def initialize(attributes)
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end