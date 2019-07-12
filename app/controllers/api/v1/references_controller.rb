class Api::V1::ReferencesController < ApplicationController
  before_action :find_reference, only: [:update, :destroy]

  def create
    @reference = Reference.create!(reference_params)
    render json: @reference
  end

  def index
    if !params[:tag_ids]
      render json: current_user.references.uniq
    else
      @references = current_user.references.uniq.select{ |r| params[:tag_ids].all? { |t| r.tag_ids.include?(t.to_i) }}
      render json: @references
    end
  end

  def update
    @reference.update(reference_params)
    render json: @reference
  end

  def destroy
    @reference.destroy
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
