class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :references

  def references
    ActiveModel::SerializableResource.new(object.references, each_serializer: ReferenceSerializer)
  end
end
