# frozen_string_literal: true

class TotalPhrasesController < ApplicationController
  before_action :set_total_phrase, only: %i[edit update destroy]

  def headers; end

  def footers; end

  def destroy
    @total_phrase.destroy
    redirect_to params[:redirect_to]
  end

  def new_footer; end

  def new_header; end

  def edit; end

  def update
    @total_phrase.update!(total_phrase_params)
    redirect_to params[:redirect_to]
  end

  def create
    TotalPhrase.create!(total_phrase_params)
    redirect_to params[:redirect_to]
  end

  private

  def set_total_phrase
    @total_phrase = TotalPhrase.find(params[:id])
  end

  def total_phrase_params
    params.require(:total_phrase).permit(:part, :value)
  end
end
