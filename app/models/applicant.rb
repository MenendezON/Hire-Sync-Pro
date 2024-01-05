class Applicant < ApplicationRecord
  belongs_to :post

  has_one_attached :resume, dependent: :destroy
  has_one_attached :cover_letter, dependent: :destroy

  has_many :experiences
  has_many :educations

  accepts_nested_attributes_for :experiences, allow_destroy: true
  accepts_nested_attributes_for :educations, allow_destroy: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :gender, presence: true
  validates :address, presence: true
  validates :language, presence: true
  validates :experience, presence: true
  validates :source, presence: true
  validates :resume, presence: true
  validates :cover_letter, presence: true
end