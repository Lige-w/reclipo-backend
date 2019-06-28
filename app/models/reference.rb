class Reference < ApplicationRecord
  belongs_to :project
  has_many :reference_authors
  has_many :authors, through: :reference_authors
  accepts_nested_attributes_for :authors
end
