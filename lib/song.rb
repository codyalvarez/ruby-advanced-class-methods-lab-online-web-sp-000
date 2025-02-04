class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new #instantiates
    song.save #saves
    song # returns
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
      @@all.detect  { |song| song.name == name }
  end

   def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create_by_name(name)
   end

   def self.alphabetical
     @@all.sort_by { |song| song.name }
   end

   def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
   end

   def self.create_from_filename(filename)
     result = self.new_from_filename(filename)
     song = self.create
     song.name = result.name
     song.artist_name = result.artist_name
     song
   end

   def self.destroy_all
     self.all.clear
   end

end
