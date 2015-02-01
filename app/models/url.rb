class Url < ActiveRecord::Base
  validates :full_url, presence: true
end
