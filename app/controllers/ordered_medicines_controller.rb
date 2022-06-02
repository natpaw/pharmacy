class OrderedMedicinesController < ApplicationController
  before_action :get_order
  before_action :set_ordered_medicine, only: %i[ show edit update destroy ]
  
  rescue_from CheckPrescription::NoPresriptionNeededError, with: :no_presc_needed
  rescue_from CheckPrescription::PrescriptionNotFoundError, with: :presc_not_found
  rescue_from CheckPrescription::WrongMedicineError, with: :wrong_medicine
  rescue_from CheckPrescription::PrescriptionNotActiveError, with: :presc_not_active

  
  #some_params = params.require(:ordered_medicine).permit(:presc_number, :quantity, :medicine_id, :order_id)
  # GET /ordered_medicines or /ordered_medicines.json
  def index
    @ordered_medicines = @order.ordered_medicines
	authorize @ordered_medicines
  end

  # GET /ordered_medicines/1 or /ordered_medicines/1.json
  def show
	authorize @ordered_medicine
  end

  # GET /ordered_medicines/new
  def new
    @ordered_medicine = @order.ordered_medicines.build
	authorize @ordered_medicine
  end

  # GET /ordered_medicines/1/edit
  def edit
	authorize @ordered_medicine
  end

  # POST /ordered_medicines or /ordered_medicines.json
  def create
    @ordered_medicine = @order.ordered_medicines.build(ordered_medicine_params)
	authorize @ordered_medicine
	CheckPrescription.call(@ordered_medicine)
    respond_to do |format|
      if @ordered_medicine.save
        format.html { redirect_to edit_order_path(@order), notice: "Ordered medicine was successfully created." }
        format.json { render :show, status: :created, location: @ordered_medicine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ordered_medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordered_medicines/1 or /ordered_medicines/1.json
  def update
	authorize @ordered_medicine
	@ordered_medicine = @order.ordered_medicines.build(ordered_medicine_params)
	CheckPrescription.call(@ordered_medicine)
    respond_to do |format|
      if @ordered_medicine.update(ordered_medicine_params)
        format.html { redirect_to edit_order_path(@order), notice: "Ordered medicine was successfully updated." }
        format.json { render :show, status: :ok, location: @ordered_medicine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ordered_medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordered_medicines/1 or /ordered_medicines/1.json
  def destroy
	authorize @ordered_medicine
    @ordered_medicine.destroy

    respond_to do |format|
      format.html { redirect_to edit_order_path(@order), notice: "Ordered medicine was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def no_presc_needed
	flash[:alert] = "Рецепт не потрібний"
	render "edit"
  end
  
  def presc_not_found
	flash[:alert] = "Рецепт не знайдений"
	render "edit"
  end
  
  def wrong_medicine
	flash[:alert] = "Рецепт на інший препарат"
	render "edit"
  end
  
  def presc_not_active
	flash[:alert] = "Рецепт неактивний"
	render "edit"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordered_medicine
      @ordered_medicine = @order.ordered_medicines.find(params[:id])
    end
	
	def get_order
		@order = policy_scope(Order).find(params[:order_id])
	end

    # Only allow a list of trusted parameters through.
    def ordered_medicine_params
      params.require(:ordered_medicine).permit(:presc_number, :quantity, :order_id, :medicine_id, :order_id)
    end
end
