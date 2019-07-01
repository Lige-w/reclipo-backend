class Project < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :references
end
