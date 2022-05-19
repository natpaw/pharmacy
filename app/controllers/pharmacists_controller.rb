class PharmacistsController < ApplicationController
  before_action :set_pharmacist, only: %i[ show edit update destroy ]

  # GET /pharmacists or /pharmacists.json
  def index
    @pharmacists = Pharmacist.all
	authorize @pharmacists
  end

  # GET /pharmacists/1 or /pharmacists/1.json
  def show
	authorize @pharmacist
  end

  # GET /pharmacists/new
  def new
    @pharmacist = Pharmacist.new
  end

  # GET /pharmacists/1/edit
  def edit
	authorize @pharmacist
  end

  # POST /pharmacists or /pharmacists.json
  def create
    @pharmacist = Pharmacist.new(pharmacist_params)

    respond_to do |format|
      if @pharmacist.save
        format.html { redirect_to pharmacist_url(@pharmacist), notice: "Pharmacist was successfully created." }
        format.json { render :show, status: :created, location: @pharmacist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pharmacist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pharmacists/1 or /pharmacists/1.json
  def update
	authorize @pharmacist
    respond_to do |format|
      if @pharmacist.update(pharmacist_params)
        format.html { redirect_to pharmacist_url(@pharmacist), notice: "Pharmacist was successfully updated." }
        format.json { render :show, status: :ok, location: @pharmacist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pharmacist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pharmacists/1 or /pharmacists/1.json
  def destroy
	authorize @pharmacist
    @pharmacist.destroy

    respond_to do |format|
      format.html { redirect_to pharmacists_url, notice: "Pharmacist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pharmacist
      @pharmacist = Pharmacist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pharmacist_params
      params.require(:pharmacist).permit(:first_name, :last_name, :email, :password, :confirmed_password)
    end
end
