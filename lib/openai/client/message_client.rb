require_relative '../models/list_messages'

module OpenAI
  class MessageClient

    def initialize(rest_client)
      @rest_client = rest_client
    end

    # Returns a list of messages for a given thread.
    # @param @required thread_id The ID of the thread the messages belong to.
    # @param limit A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
    # @param order Sort order by the created_at timestamp of the objects. asc for ascending order and desc for descending order.
    # @param after A cursor for use in pagination. after is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
    # @param before A cursor for use in pagination. before is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
    # @param run_id Filter messages by the run ID that generated them.
    # @return A list of [OpenAIAssistant::Model::Message] objects.
    def get_list_messages_by_thread_id(thread_id, limit = 20, order = QueryParams::SortOrder::DESC, after = nil, before = nil, run_id = nil)
      api_response = @rest_client.call_get("/threads/#{thread_id}/messages", {
        'limit' => limit, 'order' => order, 'after' => after, 'before' => before, 'run_id' => run_id
      }.select { |_,v| !v.nil? })
      Model::ListMessages.new(api_response)
    end

  end
end
