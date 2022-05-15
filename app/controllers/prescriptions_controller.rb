class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: %i[ show edit update destroy ]

  # GET /prescriptions or /prescriptions.json
  def index
    @prescriptions = policy_scope(Prescription)
	authorize @prescriptions
  end

  # GET /prescriptions/1 or /prescriptions/1.json
  def show
	authorize @prescription
  end

  # GET /prescriptions/new
  def new
    @prescription = Prescription.new
	authorize @prescription
  end

  # GET /prescriptions/1/edit
  def edit
	authorize @prescription
  end

  # POST /prescriptions or /prescriptions.json
  def create
    @prescription = Prescription.new(prescription_params)
	authorize @prescription
    respond_to do |format|
      if @prescription.save
        format.html { redirect_to prescription_url(@prescription), notice: "Prescription was successfully created." }
        format.json { render :show, status: :created, location: @prescription }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prescriptions/1 or /prescriptions/1.json
  def update
	@prescription = current_doctor.prescriptions.find(params[:id])
	authorize @prescription
    respond_to do |format|
      if @prescription.update(prescription_params)
        format.html { redirect_to prescription_url(@prescription), notice: "Prescription was successfully updated." }
        format.json { render :show, status: :ok, location: @prescription }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescriptions/1 or /prescriptions/1.json
  def destroy
    @prescription.destroy
	authorize @prescription
    respond_to do |format|
      format.html { redirect_to prescriptions_url, notice: "Prescription was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescription
      @prescription = Prescription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prescription_params
	  params.require(:prescription).permit(:number, :exp_date, :quantity, :children, :doctor_id, :medicine_id)
    end
end
