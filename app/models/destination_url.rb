class DestinationUrl < ActiveRecord::Base
  has_many :tracked_urls
  validates_presence_of :name

  accepts_nested_attributes_for :tracked_urls
end
