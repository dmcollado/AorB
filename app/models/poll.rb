class Poll < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :poll_items


  validates :slug, uniqueness: true

  before_create :generate_slug

  def to_param
    self.slug
  end

  private 

    def generate_slug
      self.slug = SecureRandom.hex(3)
    end 

end
