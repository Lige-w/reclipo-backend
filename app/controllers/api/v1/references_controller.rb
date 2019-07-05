class Api::V1::ReferencesController < ApplicationController
  before_action :find_reference, only: [:update, :destroy]

  def create
    @reference = Reference.create!(reference_params)
    @project = Project.find(reference_params[:project_ids][0])
    render json: @project
  end

  def update
    @reference.update(reference_params)
    render json: Project.find(params[:current_project])
  end

  def destroy
    @reference.destroy!
    render json: {message: 'success'}
  end
  private

  def find_reference
    @reference = Reference.find(params[:id])
  end

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
