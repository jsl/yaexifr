$:.unshift "#{File.dirname(__FILE__)}/../lib"
require 'test/unit'
require 'yaexifr'

def quicktime_movie_path
  File.join File.dirname(__FILE__), 'files', 'test-960x540.mov'
end
