class OrderedMedicinesController < ApplicationController
  before_action :set_ordered_medicine, only: %i[ show edit update destroy ]

  # GET /ordered_medicines or /ordered_medicines.json
  def index
    @ordered_medicines = OrderedMedicine.all
  end

  # GET /ordered_medicines/1 or /ordered_medicines/1.json
  def show
  end

  # GET /ordered_medicines/new
  def new
    @ordered_medicine = OrderedMedicine.new
  end

  # GET /ordered_medicines/1/edit
  def edit
  end

  # POST /ordered_medicines or /ordered_medicines.json
  def create
    @ordered_medicine = OrderedMedicine.new(ordered_medicine_params)

    respond_to do |format|
      if @ordered_medicine.save
        format.html { redirect_to ordered_medicine_url(@ordered_medicine), notice: "Ordered medicine was successfully created." }
        format.json { render :show, status: :created, location: @ordered_medicine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ordered_medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordered_medicines/1 or /ordered_medicines/1.json
  def update
    respond_to do |format|
      if @ordered_medicine.update(ordered_medicine_params)
        format.html { redirect_to ordered_medicine_url(@ordered_medicine), notice: "Ordered medicine was successfully updated." }
        format.json { render :show, status: :ok, location: @ordered_medicine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ordered_medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordered_medicines/1 or /ordered_medicines/1.json
  def destroy
    @ordered_medicine.destroy

    respond_to do |format|
      format.html { redirect_to ordered_medicines_url, notice: "Ordered medicine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordered_medicine
      @ordered_medicine = OrderedMedicine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ordered_medicine_params
      params.require(:ordered_medicine).permit(:presc_number, :quantity, :order_id, :prescription_id, :medicine_id)
    end
end