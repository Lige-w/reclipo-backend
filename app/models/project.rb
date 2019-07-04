class Project < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :project_references, dependent: :destroy
  has_many :references, through: :project_references
end
