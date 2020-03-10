# frozen_string_literal: true

class PhrasesController < ApplicationController
  before_action :set_phrase, only: %i[show edit update destroy up down]
  before_action :set_keyphrase, only: %i[index new create]
  before_action :only_admin!

  respond_to :html

  def index
    @phrases = @keyphrase.phrases.order(:sort)
    respond_with(@phrases)
  end

  def show
    respond_with(@phrase)
  end

  def new
    @phrase = Phrase.new
    respond_with(@phrase)
  end

  def edit; end

  def create
    @keyphrase.phrases.create(phrase_params)
    redirect_to keyphrase_phrases_path(@keyphrase)
  end

  def update
    @phrase.update(phrase_params)
    redirect_to keyphrase_phrases_path(@phrase.keyphrase)
  end

  def destroy
    @phrase.destroy
    redirect_to keyphrase_phrases_path(@phrase.keyphrase)
  end

  def up
    phrase_service.up
  end

  def down
    phrase_service.down
  end

  private

  def set_phrase
    @phrase = Phrase.find(params[:id])
  end

  def set_keyphrase
    @keyphrase = keyphrase_id.present? ? Keyphrase.find(keyphrase_id) : @phrase.keyphrase
  end

  def phrase_params
    params.require(:phrase).permit(:value, :keyphrase_id)
  end

  def keyphrase_id
    params[:keyphrase_id]
  end

  def phrase_service
    PhraseService.new(id: params[:id])
  end
end
