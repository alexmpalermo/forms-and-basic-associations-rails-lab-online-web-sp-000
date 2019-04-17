class Song < ActiveRecord::Base
  has_many :notes 
  belongs_to :genre 
  belongs_to :artist
  
   def genre_name=(name)
     self.genre = Genre.find_by(name: name)
   end
 
   def genre_name
      self.genre ? self.genre.name : nil
   end
   
   def artist_name=(name)
     self.artist = Artist.find_by(name: name)
   end
 
   def artist_name
      self.artist ? self.artist.name : nil
   end
   
   def notes=(ids)
     ids.each do |id|
       note = Note.find(id)
       self.notes << note
     end
   end
end
