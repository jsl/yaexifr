module YAEXIFR
  module Extensions
    module File
      module EXIF
        def self.included(base)
          raise YAEXIFR::MissingExifToolError.new("You are missing ExifTool (http://www.sno.phy.queensu.ca/~phil/exiftool/)") if `which exiftool`.empty?
        end

        def exif
          return @exif if @exif

          @exif = Hash.new
          raw_exif.strip.split(/\n/).each { |line|
            key, val = line.split(/:/)
            @exif[key.to_s.strip] = val.to_s.strip
          }

          # Add some additional values
          @exif['width'], @exif['height'] = @exif['Image Size'].split(/x/) if @exif.include?('Image Size')
          
          @exif
        end
 
        def raw_exif
          @raw_exif ||= run_command("exiftool #{path}")
        end

        def run_command(cmd)
          Kernel.puts "Running command: #{cmd}" if YAEXIFR.debug
          `#{cmd}`
        end
        private :run_command
      end
    end
  end
end
