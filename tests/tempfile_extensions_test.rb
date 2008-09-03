require 'test_helper'

class TempfileFileExtensionsTest < Test::Unit::TestCase
  def test_raw_exif
    with_tempfile do |tempfile|
      tempfile.puts File.read(quicktime_movie_path)
    
      assert tempfile.respond_to?(:raw_exif)
      assert tempfile.raw_exif =~ /File Name\s*\:\s*test\_tempfile/
    end
  end

  def test_exif
    with_tempfile do |tempfile|
      tempfile = File.open(quicktime_movie_path, 'r')

      assert tempfile.respond_to?(:exif)
      assert tempfile.exif.is_a?(Hash)
      assert_equal File.basename(quicktime_movie_path), tempfile.exif['File Name']
      assert_equal "video/mp4", tempfile.exif['MIME Type']   
      assert_equal "960x540", tempfile.exif['Image Size']
      assert_equal "960", tempfile.exif['width']
      assert_equal "540", tempfile.exif['height']
    end
  end

  private
  def with_tempfile &blk
    tempfile = Tempfile.new('test_tempfile')
    tempfile.puts File.read(quicktime_movie_path)
    blk.call(tempfile)
    tempfile.close
  end
end
