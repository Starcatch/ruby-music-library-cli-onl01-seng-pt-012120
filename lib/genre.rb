class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []

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
 
 
 def self.create(genre)
   self.new(genre)
 end 
 
 def artists
    @new_array = []
    @songs.each do |song|
      if @new_array.include?(song.artist)
        nil
      else
        @new_array << song.artist
      end
    end
    @new_array
  end
end 