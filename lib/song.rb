class Song
    attr_accessor :name
    attr_reader :artist
    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def artist=(artist)
        @artist = artist
        artist.songs << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)        
        song = Song.new(filename.split(" - ")[1])
        song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end
