
module OpenAI::Model
  # Represents an execution run on a thread.
  class Run

    # @return [String] The identifier, which can be referenced in API endpoints.
    attr_reader :id

    # @return [String] The object type, which is always thread.run
    attr_reader :object

    # @return [Integer] The Unix timestamp (in seconds) for when the run was created.
    attr_reader :created_at

    # @return [String] The ID of the thread that was executed on as a part of this run.
    attr_reader :thread_id

    # @return [String] The ID of the assistant used for execution of this run.
    attr_reader :assistant_id

    # @return [String] The status of the run, which can be either queued, in_progress, requires_action, cancelling, cancelled, failed, completed, or expired
    attr_reader :status

    # @return [String | nil] Details on the action required to continue the run. Will be null if no action is required.
    attr_reader :required_action

    # @return [String | nil] The last error associated with this run. Will be null if there are no errors.
    attr_reader :last_error

    # @return [Integer | nil] The Unix timestamp (in seconds) for when the run will expire.
    attr_reader :expires_at

    # @return [Integer | nil] The Unix timestamp (in seconds) for when the run was started.
    attr_reader :started_at

    # @return [Integer | nil] The Unix timestamp (in seconds) for when the run was cancelled.
    attr_reader :cancelled_at

    # @return [Integer | nil] The Unix timestamp (in seconds) for when the run failed.
    attr_reader :failed_at

    # @return [Integer | nil] The Unix timestamp (in seconds) for when the run was completed.
    attr_reader :completed_at

    # @return [String | nil] Details on why the run is incomplete. Will be null if the run is not incomplete.
    attr_reader :incomplete_details

    # @return [String] The model that the assistant used for this run.
    attr_reader :model

    # @return [String] The instructions that the assistant used for this run.
    attr_reader :instructions

    # @return [String] The list of tools that the assistant used for this run.
    attr_reader :tools

    # @return [Hash[String, String]] Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maximum of 512 characters long.
    attr_reader :metadata

    # @return [String | nil] Usage statistics related to the run. This value will be null if the run is not in a terminal state (i.e. in_progress, queued, etc.).
    attr_reader :usage

    # @return [Number | nil] The sampling temperature used for this run. If not set, defaults to 1.
    attr_reader :temperature

    # @return [Number | nil] The nucleus sampling value used for this run. If not set, defaults to 1.
    attr_reader :top_p

    # @return [Integer | nil] The maximum number of prompt tokens specified to have been used over the course of the run.
    attr_reader :max_prompt_tokens

    # @return [Integer | nil] The maximum number of completion tokens specified to have been used over the course of the run.
    attr_reader :max_completion_tokens

    # @return [String] Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
    attr_reader :truncation_strategy

    # @return [String] Controls which (if any) tool is called by the model. none means the model will not call any tools and instead generates a message. auto is the default value and means the model can pick between generating a message or calling one or more tools. required means the model must call one or more tools before responding to the user. Specifying a particular tool like {"type": "file_search"} or {"type": "function", "function": {"name": "my_function"}} forces the model to call that tool.
    attr_reader :tool_choice

    # @return [String] Specifies the format that the model must output.
    attr_reader :response_format

    def initialize(attributes)
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end
