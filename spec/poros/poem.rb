require 'rails_helper'

describe Poem, type: :poros do
  before :each do
    @poem_data = { title: "Defrauded I a Butterfly --",
              author: 'Emily Dickinson',
              lines: ['Defrauded I a Butterfly --",
              "The lawful Heir -- for Thee --'],
              linecount: '2' }
  end
  it 'exists' do
    poem = Poem.new(@poem_data)
    expect(poem.title).to eq(@poem_data[:title])
    expect(poem.lines).to eq("Defrauded I a Butterfly --",
    "The lawful Heir -- for Thee --")
    expect(poem.author).to eq(@poem_data[:author])
  end
end
