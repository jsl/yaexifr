require File.dirname(__FILE__) + '/file_extensions'
require File.dirname(__FILE__) + '/errors'

module YAEXIFR
  VERSION = '0.1'
  
  def self.debug; false; end
end

File.send(:include, YAEXIFR::Extensions::File::EXIF)
