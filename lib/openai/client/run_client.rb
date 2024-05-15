require_relative '../models/run'

module OpenAI
  class RunClient

    def initialize(rest_client)
      @rest_client = rest_client
    end

    # Retrieves a run status by thread_id and run_id
    # @param @required thread_id The ID of the thread that was run.
    # @param @required run_id The ID of the run to retrieve.
    # @return The [OpenAIAssistant::Model::Run] object matching the specified ID.
    def get_run_status_by_thead_id_and_run_id(thread_id, run_id)
      api_response = @rest_client.call_get("/threads/#{thread_id}/runs/#{run_id}")
      Model::Run.new(api_response)
    end

  end
end
