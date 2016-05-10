class Location < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, maximum: 80
  validates_length_of :code, maximum: 10
end
