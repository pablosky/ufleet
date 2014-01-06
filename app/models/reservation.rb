class Reservation < ActiveRecord::Base
  belongs_to :driver
  belongs_to :vehicle


#def self.search(query)
# where(:title, query) -> This would return an exact match of the query
#where("inicio like ?", "%#{query}%") 
  
 
 # where(:inicio, query)
#end


end
