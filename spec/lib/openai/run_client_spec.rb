require 'openai/client/openai_client'
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!

  config.filter_sensitive_data("<OPENAI_API_KEY>") do |interaction|
    interaction.request.headers["Authorization"][0].sub('Bearer ', '')
  end

end

RSpec.describe OpenAI::RunClient do

  let(:client) { OpenAI::Client.new( 'OPENAI_API_KEY' ) }
  let(:valid_params) {
    { thread_id: 'thread_r0UdZWKXGMAyLfGOAIYbHNka', run_id: 'run_uheZalMazaLlhEf7chaEgKNB' }
  }
  let(:invalid_params) {
    { thread_id: 'FAKE_THREAD_ID', run_id: 'FAKE_RUN_ID' }
  }

  describe '#get_run_status_by_thead_id_and_run_id' do

    context "given correct thread_id and run_id" do
      it "execute successfully and return correct run object" do
        VCR.use_cassette('get_run_status_by_thead_id_and_run_id#success') do
          result = client.run.get_run_status_by_thead_id_and_run_id(
            thread_id = valid_params[:thread_id],
            run_id = valid_params[:run_id]
          )
          expect(result.nil?).to be false
          expect(result.thread_id).to eq(valid_params[:thread_id])
          expect(result.id).to eq(valid_params[:run_id])
          expect(result.status).to eq("completed")
        end
      end
    end

    context "given incorrect thread_id and run_id" do
      it "execute failure and throw OpenAPIException exception" do
        VCR.use_cassette('get_run_status_by_thead_id_and_run_id#failure') do
          expect {
            client.run.get_run_status_by_thead_id_and_run_id(
              thread_id = invalid_params[:thread_id],
              run_id = invalid_params[:run_id]
            )
          }.to raise_error(OpenAI::OpenAPIException)
        end
      end
    end

  end

end