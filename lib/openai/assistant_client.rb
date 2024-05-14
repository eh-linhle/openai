require_relative 'base'
require_relative 'models/list_assistants'
require_relative 'models/list_messages'
require_relative 'models/run'
require_relative 'query_params/sort_order'

module OpenAI
  class AssistantClient < RestBase

    def initialize(api_key)
      @api_key = api_key
    end

    # Get list assistants
    # @param limit A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
    # @param order Sort order by the created_at timestamp of the objects. asc for ascending order and desc for descending order.
    # @param after A cursor for use in pagination. after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
    # @param before A cursor for use in pagination. before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
    # @return A list of [OpenAIAssistant::Model::Assistant] objects.
    #
    def get_list_assistants(limit = 20, order = SortOrder::ASC, after = nil, before = nil)
      api_response = call_get('/assistants', {
        'limit' => limit, 'order' => order, 'after' => after, 'before' => before
      }.select { |_,v| !v.nil? })
      Model::ListAssistants.new(api_response)
    end

    # Get assistant details by assistant_id
    # @param @required assistant_id The ID of the assistant to retrieve.
    # @return The [OpenAIAssistant::Model::Assistant] object matching the specified ID.
    def get_assistant_by_id(assistant_id)
      api_response = call_get("/assistants/#{assistant_id}")
      Model::Assistant.new(api_response)
    end

    # Retrieves a run status by thread_id and run_id
    # @param @required thread_id The ID of the thread that was run.
    # @param @required run_id The ID of the run to retrieve.
    # @return The [OpenAIAssistant::Model::Run] object matching the specified ID.
    def get_run_status_by_thead_id_and_run_id(thread_id, run_id)
      api_response = call_get("/threads/#{thread_id}/runs/#{run_id}")
      Model::Run.new(api_response)
    end

    # Returns a list of messages for a given thread.
    # @param @required thread_id The ID of the thread the messages belong to.
    # @param limit A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
    # @param order Sort order by the created_at timestamp of the objects. asc for ascending order and desc for descending order.
    # @param after A cursor for use in pagination. after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
    # @param before A cursor for use in pagination. before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
    # @param run_id Filter messages by the run ID that generated them.
    # @return A list of [OpenAIAssistant::Model::Message] objects.
    def get_list_messages_by_thread_id(thread_id, limit = 20, order = SortOrder::DESC, after = nil, before = nil, run_id = nil)
      api_response = call_get("/threads/#{thread_id}/messages", {
        'limit' => limit, 'order' => order, 'after' => after, 'before' => before, 'run_id' => run_id
      }.select { |_,v| !v.nil? })
      Model::ListMessages.new(api_response)
    end

  end
end
