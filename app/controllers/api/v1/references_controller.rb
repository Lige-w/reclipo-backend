class Api::V1::ReferencesController < ApplicationController
  def create
    @reference = Reference.create!(reference_params)
    @project = Project.find(reference_params[:project_ids][0])
    render json: @project
  end

  private

  def reference_params
    params.require(:reference).permit(
        :title,
        :publish_date,
        :publisher_location,
        :publisher,
        :url,
        :reference_type,
        :medium,
        :page_numbers,
        :volume_number,
        :issue_number,
        project_ids: [],
        authors_attributes: [:first_name, :last_name, :middle_initial],
        tags_attributes: [:name]
    )
  end
end
