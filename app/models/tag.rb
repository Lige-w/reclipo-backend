class Tag < ApplicationRecord
  has_many :reference_tags
  has_many :references, through: :reference_tags
  # validates :name, presence: true
end
