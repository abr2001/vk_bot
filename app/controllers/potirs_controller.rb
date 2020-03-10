# frozen_string_literal: true

class PotirsController < ApplicationController
  before_action :set_parent, only: [:index]

  def index
    load_potirs(params[:parent_id])
  end

  def create
    Potir.create!(potir_params)
    load_potirs(potir_params[:parent_id].blank? ? nil : potir_params[:parent_id])
  end

  def destroy
    @potir = Potir.find params[:id]
    load_potirs(@potir.parent_id)
    @potir.destroy
  end

  private

  def potir_params
    params.require(:potir).permit(:name, :parent_id)
  end

  def load_potirs(parent_id)
    @potirs = Potir.includes(:children).where(parent_id: parent_id)
  end

  def set_parent
    @parent = Potir.find_by(id: params[:parent_id])
  end
end
