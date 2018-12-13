# Grammarbot

A Ruby API client for [GrammrBot API](https://www.grammarbot.io/quickstart)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grammarbot'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grammarbot

## Usage
Client initialization, `api_key`, `language` and `base_uri` are optional and could be ommited, or defined later

    gbot = Grammarbot::Client.new(api_key: 'grammarbot_default_key', language: 'en-US', base_uri: 'http://api.grammarbot.io/v2')

    gbot.api_key = 'new_api_key'
    gbot.language = 'en-GB'
    gbot.base_uri = 'http://pro.grammarbot.io/v3'

Don't want to check the key into source control? Put the key on the GRAMMARBOT_API_KEY environment variable!

Simple example

    result = gbot.check("I can't remember how to go their.")

    result.language.code # => 'en-US'
    result.matches.size # => 1
    result.matches.first.message # => "Statistics suggests that 'there' (as in 'Is there an answer?') might be the correct word here, not 'their' (as in 'It’s not their fault.'). Please check."


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/GrammarBot-API/grammarbot-rb.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

