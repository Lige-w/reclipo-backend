class Api::V1::NotesController < ApplicationController
  def create
    @reference = Reference.find(params[:reference_id])

    @note = @reference.notes.build()
    @reference.save

    render json: @note
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)

    render json: @note
  end

  def note_params
    params.require(:note).permit(:name, :content)
  end
end
