class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  has_many :projects
  has_many :references, through: :projects
  has_many :tags, through: :references
end
