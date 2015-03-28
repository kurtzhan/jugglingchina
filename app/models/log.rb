class Log < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  validates_presence_of :user_id
end
