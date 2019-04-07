require 'pry'

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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if song = self.find_by_name(song_name)
      song
    else
      song = self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort do |song1, song2|
      song1.name <=> song2.name  #we want to sort by the song name, not the songs themselves
    end
  end

end
