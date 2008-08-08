require 'test_helper'

class FileExtensionsTest < Test::Unit::TestCase
  def test_raw_exif
    file = File.open(quicktime_movie_path, 'r')

    assert file.respond_to?(:raw_exif)
    assert file.raw_exif.include?("File Name                       : test-960x540.mov")
  end

  def test_exif
   file = File.open(quicktime_movie_path, 'r')

   assert file.respond_to?(:exif)
   assert file.exif.is_a?(Hash)
   assert_equal File.basename(quicktime_movie_path), file.exif['File Name']
   assert_equal "video/mp4", file.exif['MIME Type']   
   assert_equal "960x540", file.exif['Image Size']
   assert_equal "960", file.exif['width']
   assert_equal "540", file.exif['height']
  end

end
