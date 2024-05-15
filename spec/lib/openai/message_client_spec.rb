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

RSpec.describe OpenAI::MessageClient do

  let(:client) { OpenAI::Client.new( 'OPENAI_API_KEY' ) }
  let(:valid_thread_id) { 'thread_r0UdZWKXGMAyLfGOAIYbHNka' }
  let(:invalid_thread_id) { 'FAKE_THREAD_ID' }

  describe '#get_list_messages_by_thread_id' do

    context "given correct params" do
      it "execute successfully and return list of messages" do
        VCR.use_cassette('get_list_messages_by_thread_id#success') do
          result = client.message.get_list_messages_by_thread_id(
            thread_id = valid_thread_id
          )
          expect(result.nil?).to be false
          expect(result.data.nil?).to be false
          expect(result.data.length).to eq(4)
        end
      end
    end

    context "given incorrect params" do
      it "execute failure and throw OpenAPIException exception" do
        VCR.use_cassette('get_list_messages_by_thread_id#failure') do
          expect {
            result = client.message.get_list_messages_by_thread_id(
              thread_id = invalid_thread_id
            )
          }.to raise_error(OpenAI::OpenAPIException)
        end
      end
    end

  end

end