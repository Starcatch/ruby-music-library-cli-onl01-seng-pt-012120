class Song
  attr_accessor :name, :genre
  
  @@all= []

 def initialize(name, artist = nil, genre = nil)
   @name = name 
   if artist != nil #can be invoked with an optional second argument, an Artist object to be assigned to the song's 'artist' #property (song belongs to artist)
     self.artist = artist
   end 
    if genre != nil
      self.genre = genre
  end 
   save
 end 
 
 def artist
   @artist
  end 
  
  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end
 
 def genre
   @genre
  end 
  
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

 
 def self.all
   @@all
 end
 
 def self.destroy_all
   @@all = []
 end 
 
 def save
   
   @@all << self
 end 
 
 
 def self.create(name)
   self.new(name)
 end 
 
  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    # @@all.detect do |song|
    #   if song.name == name
    #     song
    #   else
    #     self.create(name)
    #   end
    # end
    self.find_by_name(name) || self.create(name)

  end
 
  def self.new_from_filename(filename)
    array = filename.split(" - ")

    song_name = array[1]
    artist_name = array[0]
    genre_name = array[2].split(".mp3").join

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
end 