class Language < ActiveRecord::Base
  attr_accessible :name,
		  :description,
          :approved_flag,
		  :approved_by
  validates :name, :presence => true, :length => { :maximum => 50 }
  
  
end
