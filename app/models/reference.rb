class Reference < ApplicationRecord
  has_many :reference_authors, dependent: :destroy
  has_many :authors, through: :reference_authors
  has_many :reference_tags, dependent: :destroy
  has_many :tags, through: :reference_tags
  has_many :notes, dependent: :destroy
  has_many :project_references, dependent: :destroy
  has_many :projects, through: :project_references
  accepts_nested_attributes_for :authors
  accepts_nested_attributes_for :tags

  # validates :title, presence: true

  def authors_attributes=(author_attributes)
    self.authors = []
    author_attributes.each do |author_attribute|
      author = Author.find_or_create_by(author_attribute)
      self.authors << author unless self.authors.include?(author)
    end
  end

  def tags_attributes=(tag_attributes)
    self.tags = []
    tag_attributes.each do |tag_attribute|
      tag = Tag.find_or_create_by(tag_attribute)
      self.tags << tag unless self.tags.include?(tag)
    end
  end
end
