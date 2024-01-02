class Applicant < ApplicationRecord
  belongs_to :post

  has_many :experiences
  has_many :educations

  accepts_nested_attributes_for :experiences, allow_destroy: true
  accepts_nested_attributes_for :educations, allow_destroy: true
end