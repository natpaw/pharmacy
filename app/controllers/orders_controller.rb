class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

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
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
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
