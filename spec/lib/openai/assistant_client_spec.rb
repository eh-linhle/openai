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

RSpec.describe OpenAI::AssistantClient do

  let(:client) { OpenAI::Client.new( 'OPENAI_API_KEY' ) }

  let(:invalid_limit_param) { 'invalidLimitParam' }
  let(:valid_assistant) { {
    id: 'asst_cYuAGMVRVUmGFlGbcRcRPj6I',
    name: 'Employee Creation - Cleaner' } }
  let(:fake_assistant_id) { 'FAKE_ASSISTANT_ID' }

  describe '#get_list_assistants' do

    context "given correct params" do
      it "execute successfully and return correct list of assistants" do
        VCR.use_cassette('get_list_assistants#success') do
          result = client.assistant.get_list_assistants
          expect(result.nil?).to be false
          expect(result.data.nil?).to be false
          expect(result.data.length).to eq(20)
        end
      end
    end

    context "given incorrect params" do
      it "execute failure and raise OpenAPIException exception" do
        VCR.use_cassette('get_list_assistants#failure') do
          expect {
            client.assistant.get_list_assistants(limit = invalid_limit_param)
          }.to raise_error(OpenAI::OpenAPIException)
        end
      end
    end

  end

  describe '#get_assistant_by_id' do

    context "given valid assistant id" do
      it "execute successfully and return correct assistant object" do
        VCR.use_cassette('get_assistant_by_id#success') do
          result = client.assistant.get_assistant_by_id(valid_assistant[:id])
          expect(result.nil?).to be false
          expect(result.id).to eq(valid_assistant[:id])
          expect(result.name).to eq(valid_assistant[:name])
        end
      end
    end

    context "given invalid assistant id" do
      it "execute failure and raise OpenAPIException exception" do
        VCR.use_cassette('get_assistant_by_id#failure') do
          expect {
            client.assistant.get_assistant_by_id(fake_assistant_id)
          }.to raise_error(OpenAI::OpenAPIException)
        end
      end
    end

  end

end