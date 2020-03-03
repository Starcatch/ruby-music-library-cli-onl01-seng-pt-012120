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
end 