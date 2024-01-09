class Post < ApplicationRecord
  before_save :generate_slug
  belongs_to :category
  belongs_to :user
  belongs_to :company
  has_many :applicants, dependent: :destroy

  validates :title, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :deadline, presence: true
  validates :summary, presence: true
  validates :duties, presence: true
  validates :contract, presence: true
  validates :qualifications, presence: true
  validates :extrat, presence: true
  validates :available, presence: false
  validates :category, presence: true

  private

  def generate_slug
    self.slug = title.parameterize
  end
end
