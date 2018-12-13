require 'spec_helper'

describe 'Integration spec' do
  it 'works' do
    gbot = GrammarBot.new
    results = gbot.check("I can't remember how to go their.")
    num_errors = results['matches'].length
    expect(num_errors).to eql(1)
  end
end
