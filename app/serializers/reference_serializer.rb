class ReferenceSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :authors,
             :publisher_location,
             :publish_date,
             :publisher,
             :url,
             :reference_type,
             :page_numbers,
             :volume_number,
             :issue_number,
             :medium,
             :authors,
             :tags,
             :notes
end
