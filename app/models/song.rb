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
   
   def note_ids=(ids)
     ids.each do |id|
       note = Note.find(id)
       self.notes << note
     end
   end
end
