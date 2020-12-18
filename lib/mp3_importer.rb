class MP3Importer
    attr_accessor :path, :files

    def initialize(path)
        @path = path
        @files = []
    end

    def files
        files = Dir.entries(path).select{|file| file[/(.*?)\.(mp3)$/]}
    end

    def import
        files.each do |file|
            Song.new_by_filename(file)
        end     
    end
end
