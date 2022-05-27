class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  rescue_from CheckMedicine::EmptyOrderError, with: :empty_order
  rescue_from CheckMedicine::MedicineQuantityError, with: :medicine_not_enough
  
  # GET /orders or /orders.json
  def index
    @orders = policy_scope(Order)
	authorize @orders
  end

  # GET /orders/1 or /orders/1.json
  def show
	authorize @order
  end

  # GET /orders/new
  def new
    @order = Order.new
	authorize @order
  end

  # GET /orders/1/edit
  def edit
	authorize @order
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
	authorize @order
    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
	authorize @order
	total = OrderTotal.call(params[:id])
	CheckMedicine.call(params[:id])
    respond_to do |format|
      if @order.update(order_params.merge(:total => total))
		if order_params[:status] == 'pending'
			MedicineBooking.call(params[:id])
			OrderMailer.with(order: @order).order_user_email.deliver_later
			OrderMailer.with(order: @order).order_admin_email.deliver_later
		end
		if order_params[:status] == 'declined'
			MedicineUnbooking.call(params[:id])
		end
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
	
  end
  
  def empty_order
	flash[:alert] = "Замовлення порожнє. Додайте ліки в замовлення"
	render "edit"
  end
  
  def medicine_not_enough
	flash[:alert] = "Недостатня кількість на складі"
	render "edit"
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
	authorize @order
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = policy_scope(Order).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
       params.require(:order).permit(:comment, :user_id, :pharmacist_id, :status)
    end
end
