class Url < ActiveRecord::Base
  has_many :visits

  validates :full_url, presence: true
  validates :slug, uniqueness: true

  before_save :generate_slug
  before_save :grab_title

  def generate_slug
    self.slug = SecureRandom.urlsafe_base64(4)
  end

  def grab_title
    self.title = TitleGrabber.find_title(self.full_url)
  end
end
