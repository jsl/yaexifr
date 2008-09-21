Gem::Specification.new do |s|
  s.name     = "yaexifr"
  s.version  = "0.0.1"
  s.date     = "2008-10-21"
  s.summary  = "Ruby wrapper around exiftool"
  s.email    = "unknown@example.com"
  s.homepage = "http://github.com/tiegz/yaexifr"
  s.rubyforge_project = ""
  s.description = "Yaexifr wraps the exiftools package and exif-enables the File and TempFile classes in ruby"
  s.has_rdoc = true
  s.authors  = ["Tieg Zaharia"]
  s.files    = ["README", 
		"Rakefile", 
		"yaexifr.gemspec", 
		"lib/errors.rb", 
		"lib/file_extensions.rb", 
		"lib/yaexifr.rb"]
  s.test_files = ["tests/file_extensions_test.rb",
                  "tests/tempfile_extensions_test.rb",
                  "tests/test_helper.rb",
                  "tests/files/test-960x540.mov"]
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
  s.requirements << "ExifTool Perl EXIF reader"
end
