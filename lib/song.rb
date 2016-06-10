require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil,artist=nil)
    @name = name
    @artist_name = artist
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @song = self.new(name)
    @@all << @song
    @song
  end

  def self.new_by_name(name)
    @song = self.new(name)
    @@all << @song
    @song
  end

   def self.create_by_name(name)
    @song = self.new(name)
    @@all << @song
    @song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    return self.find_by_name(name) if self.find_by_name(name) != nil
    self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(song)
    song_info = song.gsub(".mp3","").split(" - ")
    song = self.new_by_name(song_info[1])
    song.artist_name = song_info[0]
    song
  end

  def self.create_from_filename(song)
    song_info = song.gsub(".mp3","").split(" - ")
    song = self.create_by_name(song_info[1])
    song.artist_name = song_info[0]

  end

  def self.destroy_all
    @@all.clear
  end



end
