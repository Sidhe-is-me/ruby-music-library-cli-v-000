class Song   
  require 'pry'
   
  attr_accessor :name , :genre, :filename
  attr_reader :artist

  @@all = []

  def initialize(name,artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    self.class.all << self
  end
  

   def self.create(name,artist=nil, genre=nil)
    song = Song.new(name)
    song.save
    song
   end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
   def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
   end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
   def self.new_from_filename(filename)
     
     filename = filename.split('-')
     
     artist_from_file = filename[0]
     song_from_file = filename[1]
     genre_from_file = filename[2].split('.')[0]
     artist = find_or_create_by_name(artist_from_file)
     song = find_or_create_by_name(song_from_file)
     genre = find_or_create_by_name(genre_from_file)
     binding.pry
     
     
   end
  
  def self.create_from_filename(filename)
     
  end
  

  
  
  
end