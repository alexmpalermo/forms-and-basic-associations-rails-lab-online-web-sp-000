class Song < ActiveRecord::Base
  has_many :notes 
  belongs_to :genre 
  belongs_to :artist
end
