class Api::V1::NotesController < ApplicationController
  before_action :find_note, only: [:update, :destroy]

  def create
    @reference = Reference.find(params[:reference_id])

    @note = @reference.notes.build()
    @reference.save

    render json: @note
  end

  def update
    @note.update(note_params)
    render json: @note
  end

  def destroy
    @note.destroy
    render json: {message: 'Success!'}
  end

  private

  def find_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:name, :content)
  end
end
