class TrackedUrl < ActiveRecord::Base
  belongs_to :destination_url
  has_many :visitors

  validates_presence_of :destination_url, if: :create_via_admin
  validates_presence_of :name

  attr_accessor :create_via_admin
end
