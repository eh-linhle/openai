# OpenAI - Assistant

Ruby interface for calling OpenAI Assistant APIs

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

## Features

- Get list assistants
- Get assistant details by assistant id
- Get assistant run status of thread id and run id
- Get list thread message by thread id

## Usage

First, obtain an API key from https://platform.openai.com/api-keys.
```ruby
require "openai"

client = OpenAI::AssistantClient.new(apiKey = 'API_KEY')

# Get list assistants
client.get_list_assistants
client.get_list_assistants(limit = 2, order = SortOrder::ASC)

# Get assistant details by assistant id
client.get_assistant_by_id('asst_NUocaU9L32vGuCEPwXdzA17Ya')

# Get assistant run status of thread id and run id
client.get_run_status_by_thead_id_and_run_id(thread_id = 'thread_r0UdZWKXGMAyLfGOAIYbHNka', run_id = 'step_44RuaZU4oe8naEUwC2mK7gGf')

# Get list thread message by thread id
client.get_list_messages_by_thread_id(thread_id = 'thread_r0UdZWKXGMAyLfGOAIYbHNka')
client.get_list_messages_by_thread_id(thread_id = 'thread_r0UdZWKXGMAyLfGOAIYbHNka', limit = 2, order = SortOrder::ASC)
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OpenaiAssistant project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/openai_assistant/blob/main/CODE_OF_CONDUCT.md).
