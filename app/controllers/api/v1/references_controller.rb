class Api::V1::ReferencesController < ApplicationController
  def create

  end

  private

  def reference_params
    params.require(:reference).permit(
        :title,
        :publish_date,
        :publisher_location,
        :publisher,
        :url,
        :type,
        :page_numbers,
        :volume_number,
        :issue_number,
        :format,
        authors_attributes: [:first_name, :last_name, :middle_initial]
    )
  end
end
