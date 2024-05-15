require_relative '../models/list_assistants'
require_relative '../models/assistant'
require_relative '../query_params/query_params'

module OpenAI
  class AssistantClient

    def initialize(rest_client)
      @rest_client = rest_client
    end

    # Get list assistants
    # @param limit A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
    # @param order Sort order by the created_at timestamp of the objects. asc for ascending order and desc for descending order.
    # @param after A cursor for use in pagination. after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
    # @param before A cursor for use in pagination. before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
    # @return A list of [OpenAIAssistant::Model::Assistant] objects.
    #
    def get_list_assistants(limit = 20, order = QueryParams::SortOrder::ASC, after = nil, before = nil)
      api_response = @rest_client.call_get('/assistants', {
        'limit' => limit, 'order' => order, 'after' => after, 'before' => before
      }.select { |_,v| !v.nil? })
      Model::ListAssistants.new(api_response)
    end

    # Get assistant details by assistant_id
    # @param @required assistant_id The ID of the assistant to retrieve.
    # @return The [OpenAIAssistant::Model::Assistant] object matching the specified ID.
    def get_assistant_by_id(assistant_id)
      api_response = @rest_client.call_get("/assistants/#{assistant_id}")
      Model::Assistant.new(api_response)
    end

  end
end
