# frozen_string_literal: true

class KeyphrasesController < ApplicationController
  before_action :set_keyphrase, only: %i[show edit update destroy]
  before_action :only_admin!

  respond_to :html

  def index
    @keyphrases = Keyphrase.all
    respond_with(@keyphrases)
  end

  def show
    respond_with(@keyphrase)
  end

  def new
    @keyphrase = Keyphrase.new
    respond_with(@keyphrase)
  end

  def edit; end

  def create
    @keyphrase = Keyphrase.new(keyphrase_params)
    @keyphrase.save
    redirect_to keyphrases_path
  end

  def update
    @keyphrase.update(keyphrase_params)
    redirect_to keyphrases_path
  end

  def destroy
    @keyphrase.destroy
    redirect_to keyphrases_path
  end

  private

  def set_keyphrase
    @keyphrase = Keyphrase.find(params[:id])
  end

  def keyphrase_params
    params.require(:keyphrase).permit(:value)
  end
end
