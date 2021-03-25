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
    song_name = Song.newS

  end



end
