class Url < ActiveRecord::Base
  has_many :visits

  validates :full_url, presence: true
  validates :slug, uniqueness: true

  before_save :generate_slug

  def generate_slug
    self.slug = SecureRandom.urlsafe_base64(4)
  end
end
