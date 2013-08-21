require 'mocha/api'
require 'reactionifier'

RSpec.configure do |config|
  config.mock_with :mocha
end

def load_html(filename)
  IO.read(File.expand_path(File.dirname(__FILE__) + '/sample_data/' + filename))
end

gif_urls = ['http://www.reactiongifs.com/wp-content/uploads/2013/08/lol-duck.gif',
            'http://www.reactiongifs.com/wp-content/uploads/2013/08/Jack-Nicholson-lol.gif',
            'http://www.reactiongifs.com/wp-content/uploads/2013/08/charlie-murphy.gif',
            'http://www.reactiongifs.com/wp-content/uploads/2013/08/faceplant.gif']

describe Reactionifier do

  reactionifier = Reactionifier::Reactionifier.new

  it 'should generate a search URL' do
    reactionifier.build_url('butts lol').should eq 'http://www.reactiongifs.com/?submit=Search&s=butts%20lol'
  end

  it 'should extract GIF URLs from search results' do
    reactionifier.stubs :fetch_html => load_html('search_results.html')
    reactionifier.reaction_gifs('lol').should eq gif_urls
  end

  it 'should extract a random GIF URL from search results' do
    reactionifier.stubs :fetch_html => load_html('search_results.html')
    gif_urls.should include reactionifier.reaction_gif('lol')
  end

  it 'should return an empty list where no results are found' do
    reactionifier.stubs :fetch_html => load_html('no_results.html')
    reactionifier.reaction_gifs('butts lol').should eq []
  end

  it 'should return nil where no result is found' do
    reactionifier.stubs :fetch_html => load_html('no_results.html')
    reactionifier.reaction_gif('butts lol').should be nil
  end

end
