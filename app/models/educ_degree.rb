class EducDegree < ActiveRecord::Base
  attr_accessible :name,
                  :description,
                  :approved_flag,
                  :approved_by

  has_many :candidate_education
  
  validates :name, :presence => true
end
