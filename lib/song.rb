require_relative 'concerns/findable.rb'

class Song
  extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre, :songs
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    self.new(name).save
  end

  def artist= artist
    @artist = artist
    @artist.add_song(self)
  end

  def genre= genre
    @genre = genre
    @genre.add_song(self)
  end
end