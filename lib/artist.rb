class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all= []

 def initialize(name)
   @name = name 
   @songs = []
  save
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
 
 
 def self.create(artist)
   self.new(artist)
 end 
 
 def add_song(song)
   if song.artist == nil
     song.artist = self 
   end 
  
  if !@songs.include?(song)
    @songs << song
   end 
  end 
  
  def genres
    @new_array = []
    @songs.each do |song|
      if @new_array.include?(song.genre)
        nil
      else
        @new_array << song.genre
      end
    end
    @new_array
  end
end 