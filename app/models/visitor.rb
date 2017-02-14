class Visitor < ActiveRecord::Base
  belongs_to :tracked_url, counter_cache: true
end