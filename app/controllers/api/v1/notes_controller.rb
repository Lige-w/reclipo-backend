class Api::V1::NotesController < ApplicationController
  def create
    @reference = Reference.find(params[:reference_id])

    @note = @reference.notes.build(note_params)
    @reference.save

    render json: @note
  end


  def note_params
    params.require(:note).permit(:name, :content)
  end
end
