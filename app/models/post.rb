class Post < ApplicationRecord
  before_save :generate_slug
  belongs_to :category


  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true

  private

  def generate_slug
    self.slug = title.parameterize
  end
end
