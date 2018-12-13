require 'spec_helper'

describe 'Integration spec' do
  let(:client) { Grammarbot::Client.new() }
  let(:text) { "I can't remember how to go their." }

  it 'just works' do
    result = client.check(text)

    expect(result.language.name).to eql('English (US)')
    expect(result.language.code).to eql('en-US')

    expect(result.matches).to be_kind_of(Array)
    expect(result.matches.size).to eql(1)

    expect(result.matches.first.message).to be
    expect(result.matches.first.replacements).not_to be_empty
    expect(result.matches.first.offset).to eql(27)
    expect(result.matches.first.length).to eql(5)
    expect(result.matches.first.context.text).to eql(text)
    expect(result.matches.first.rule).to be
  end
end
